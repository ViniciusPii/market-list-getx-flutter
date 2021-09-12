import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_list/models/product_model.dart';

class ProductListRepository extends ChangeNotifier {
  ProductListRepository();

  List<ProductModel> _productList = <ProductModel>[];
  final CollectionReference<Map<String, dynamic>> _productCL =
      FirebaseFirestore.instance.collection('products');

  List<ProductModel> get productList => _productList;
  bool isLoading = false;

  bool _isLoading() {
    return isLoading = !isLoading;
  }

  Future<void> readAll() async {
    _isLoading();

    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await _productCL.orderBy('timestamp', descending: true).get();

    final List<ProductModel> _newProductList = <ProductModel>[];

    for (final QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
      final ProductModel _product = ProductModel(
        id: doc['id'].toString(),
        productName: doc['productName'].toString(),
        quantity: int.parse(doc['quantity'].toString()),
        price: double.parse(doc['price'].toString()),
        fullPrice: double.parse(doc['fullPrice'].toString()),
        timestamp: DateTime.parse(doc['timestamp'].toDate().toString()),
      );
      _newProductList.add(_product);
      _productList = <ProductModel>[..._newProductList];
    }

    _isLoading();
    notifyListeners();
  }

  Future<void> save() async {
    final String id = _productCL.doc().id;

    await _productCL.doc(id).set(
      <String, dynamic>{
        'id': id,
        'productName': 'Abacaxi',
        'quantity': 1,
        'price': 5.99,
        'fullPrice': 5.99,
        'timestamp': DateTime.now(),
      },
    );

    notifyListeners();
  }

  Future<void> remove(ProductModel product) async {
    await _productCL.doc(product.id).delete();
    _productList.remove(product);

    notifyListeners();
  }

  int listAmountsCalculate() {
    return _productList
        .map((ProductModel product) => product.quantity)
        .reduce((int firstValue, int lastValue) => firstValue + lastValue);
  }

  double listFullPriceCalculate() {
    return _productList
        .map((ProductModel product) => product.fullPrice)
        .reduce((double firstValue, double lastValue) => firstValue + lastValue);
  }
}
