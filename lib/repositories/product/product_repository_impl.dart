import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market_list/core/exceptions/app_exception.dart';
import 'package:market_list/core/exceptions/app_exceptions_code.dart';
import 'package:market_list/models/product_model.dart';

import 'product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;
  final String collectionUser = 'users';
  final String collectionProducts = 'products';

  @override
  Stream<List<ProductModel>> readAll(String userId) {
    return _firestore
        .collection(collectionUser)
        .doc(userId)
        .collection(collectionProducts)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> querySnapshot) => querySnapshot.docs
            .map(
                (QueryDocumentSnapshot<Map<String, dynamic>> doc) => ProductModel.fromDocument(doc))
            .toList());
  }

  @override
  Future<void> save(String userId, ProductModel product) async {
    try {
      await _firestore
          .collection(collectionUser)
          .doc(userId)
          .collection(collectionProducts)
          .doc()
          .set(product.toJson())
          .timeout(const Duration(seconds: 5));
    } catch (e) {
      throw AppException(message: AppExceptionsCode.yourConnectionInstabilityMessage);
    }
  }

  @override
  Future<void> update(String userId, ProductModel product) async {
    try {
      await _firestore
          .collection(collectionUser)
          .doc(userId)
          .collection(collectionProducts)
          .doc(product.id)
          .update(product.toJson())
          .timeout(const Duration(seconds: 5));
    } catch (e) {
      throw AppException(message: AppExceptionsCode.yourConnectionInstabilityMessage);
    }
  }

  @override
  Future<void> remove(String userId, ProductModel product) async {
    await _firestore
        .collection(collectionUser)
        .doc(userId)
        .collection(collectionProducts)
        .doc(product.id)
        .delete();
  }

  @override
  Future<void> removeAll(String userId) async {
    final WriteBatch batch = _firestore.batch();

    await _firestore
        .collection(collectionUser)
        .doc(userId)
        .collection(collectionProducts)
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
      for (final QueryDocumentSnapshot<Map<String, dynamic>> doc in querySnapshot.docs) {
        batch.delete(doc.reference);
      }
    });

    return await batch.commit();
  }
}
