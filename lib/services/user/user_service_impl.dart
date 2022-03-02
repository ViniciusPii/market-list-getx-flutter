import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:market_list/repositories/image_storage/image_storage_repository.dart';

import '/repositories/user/user_repository.dart';

import 'user_service.dart';

class UserServiceImpl implements UserService {
  UserServiceImpl(
      {required UserRepository userRepository,
      required ImageStorageRepository imageStorageRepository})
      : _userRepository = userRepository,
        _imageStorageRepository = imageStorageRepository;

  final UserRepository _userRepository;
  final ImageStorageRepository _imageStorageRepository;

  @override
  Future<User?> login() => _userRepository.login();

  @override
  Future<void> signOut() => _userRepository.signOut();

  @override
  Future<void> updateDisplayName(String name) => _userRepository.updateDisplayName(name);

  @override
  Future<void> updatePhotoProfile(File file, String id) async {
    await _imageStorageRepository.uploadImage(file, id);
    final String url = await _imageStorageRepository.getDownloadURL(id);
    await _userRepository.updatePhotoProfile(url);
  }
}
