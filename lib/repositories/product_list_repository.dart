import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market_list/models/product_model.dart';

class ProductListRepository {
  final CollectionReference<Map<String, dynamic>> _productCL =
      FirebaseFirestore.instance.collection('products');

  // Stream<List<ProductModel>> readAll() {
  //   return _productCL.orderBy('timestamp', descending: true).snapshots().map(
  //         (QuerySnapshot<Map<String, dynamic>> event) => event.docs
  //             .map((QueryDocumentSnapshot<Map<String, dynamic>> e) => ProductModel.fromDocument(e))
  //             .toList(),
  //       );
  // }

  final List<ProductModel> _productList = <ProductModel>[];

  Future<List<ProductModel>> readAll() async {
    final QuerySnapshot<Map<String, dynamic>> snap =
        await _productCL.orderBy('timestamp', descending: true).get();

    _productList.clear();

    for (final QueryDocumentSnapshot<Map<String, dynamic>> item in snap.docs) {
      _productList.add(ProductModel.fromDocument(item));
    }

    return _productList;
  }

  Future<void> save(ProductModel product) async {
    await _productCL.doc().set(product.toJson());
  }

  Future<void> update(ProductModel product) async {
    await _productCL.doc(product.id).update(product.toJson());
  }

  Future<void> remove(ProductModel product) async {
    await _productCL.doc(product.id).delete();
  }

  Future<void> removeAll() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _productCL.get();
    for (final QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
      doc.reference.delete();
    }
  }
}
