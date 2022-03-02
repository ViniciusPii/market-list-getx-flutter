import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:market_list/core/exceptions/app_exception.dart';
import 'image_storage_repository.dart';

class ImageStorageRepositoryImpl implements ImageStorageRepository {
  ImageStorageRepositoryImpl({
    required FirebaseStorage storage,
  }) : _storage = storage;

  final FirebaseStorage _storage;

  @override
  Future<void> uploadImage(File file, String id) async {
    try {
      final String ref = 'images/users/$id/profile.jpg';
      await _storage.ref(ref).putFile(file);
    } on FirebaseException catch (e) {
      log(e.code);
      throw AppException(message: e.code);
    }
  }

  @override
  Future<String> getDownloadURL(String id) async {
    try {
      return await _storage.ref('images/users/$id/profile.jpg').getDownloadURL();
    } on FirebaseException catch (e) {
      log(e.code);
      throw AppException(message: e.code);
    }
  }
}
