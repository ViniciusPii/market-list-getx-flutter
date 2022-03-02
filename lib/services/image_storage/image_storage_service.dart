import 'dart:io';

abstract class ImageStorageService {
  Future<void> uploadImage(File file, String id);
  Future<String> getDownloadURL(String id);
}
