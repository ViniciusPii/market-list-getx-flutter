import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market_list/models/product_model.dart';

class ProductListRepository {
  final CollectionReference<Map<String, dynamic>> _productCL =
      FirebaseFirestore.instance.collection('users');

  final List<ProductModel> _productList = <ProductModel>[];

  Future<List<ProductModel>> readAll(String userId) async {
    final QuerySnapshot<Map<String, dynamic>> snap = await _productCL
        .doc(userId)
        .collection('products')
        .orderBy('timestamp', descending: true)
        .get();

    _productList.clear();

    for (final QueryDocumentSnapshot<Map<String, dynamic>> item in snap.docs) {
      _productList.add(ProductModel.fromDocument(item));
    }

    return _productList;
  }

  Future<void> save(String userId, ProductModel product) async {
    await _productCL.doc(userId).collection('products').doc().set(product.toJson());
  }

  Future<void> update(String userId, ProductModel product) async {
    await _productCL.doc(userId).collection('products').doc(product.id).update(
          product.toJson(),
        );
  }

  Future<void> remove(String userId, ProductModel product) async {
    await _productCL.doc(userId).collection('products').doc(product.id).delete();
  }

  Future<void> removeAll(String userId) async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await _productCL.doc(userId).collection('products').get();
    for (final QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
      doc.reference.delete();
    }
  }
}
