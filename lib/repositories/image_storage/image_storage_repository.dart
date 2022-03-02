import 'dart:io';

abstract class ImageStorageRepository {
  Future<void> uploadImage(File file, String id);
  Future<String> getDownloadURL(String id);
}
