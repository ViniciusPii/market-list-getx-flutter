import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_list/models/product_model.dart';

class ProductListRepository extends ChangeNotifier {
  ProductListRepository() {
    readAll();
  }

  List<ProductModel> _productList = <ProductModel>[];

  final CollectionReference<Map<String, dynamic>> _productCL =
      FirebaseFirestore.instance.collection('products');

  List<ProductModel> get productList => _productList;

  bool isLoading = false;

  void _isLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> readAll() async {
    _isLoading();

    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await _productCL.orderBy('timestamp', descending: true).get();

    final List<ProductModel> _newProductList = <ProductModel>[];

    for (final QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
      final ProductModel _product = ProductModel.fromDocument(doc);
      _newProductList.add(_product);
      _productList = <ProductModel>[..._newProductList];
    }

    _isLoading();
  }

  Future<void> save(ProductModel product) async {
    _isLoading();
    await _productCL.doc().set(product.toJson());
    _isLoading();
    await readAll();
  }

  Future<void> update(ProductModel product) async {
    _isLoading();
    await _productCL.doc(product.id).update(product.toJson());
    _isLoading();
    await readAll();
  }

  Future<void> remove(ProductModel product) async {
    _isLoading();
    await _productCL.doc(product.id).delete();
    _productList.remove(product);
    _isLoading();
  }

  int listAmountsCalculate() => _productList
      .map((ProductModel product) => product.quantity)
      .reduce((int firstValue, int lastValue) => firstValue + lastValue);

  double listFullPriceCalculate() => _productList
      .map((ProductModel product) => product.fullPrice)
      .reduce((double firstValue, double lastValue) => firstValue + lastValue);
}
