import 'dart:io';

import '/repositories/image_storage/image_storage_repository.dart';

import 'image_storage_service.dart';

class ImageStorageServiceImpl implements ImageStorageService {
  ImageStorageServiceImpl({
    required ImageStorageRepository imageStorageRepository,
  }) : _imageStorageRepository = imageStorageRepository;

  final ImageStorageRepository _imageStorageRepository;

  @override
  Future<void> uploadImage(File file, String id) async {
    await _imageStorageRepository.uploadImage(file, id);
  }

  @override
  Future<String> getDownloadURL(String id) async {
    return await _imageStorageRepository.getDownloadURL(id);
  }
}
