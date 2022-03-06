import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:market_list/core/auth/auth_service.dart';
import 'package:market_list/services/user/user_service.dart';
import 'package:package_info_plus/package_info_plus.dart';

class UserDetailsController extends GetxController {
  UserDetailsController({
    required UserService userService,
    required AuthService authService,
  })  : _userService = userService,
        _authService = authService;

  final UserService _userService;
  final AuthService _authService;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameEC = TextEditingController();

  final RxBool _loader = RxBool(false);
  final RxString _version = RxString('');

  bool get loader => _loader.value;
  User? get user => _authService.user;
  String get version => _version.value;

  @override
  void onInit() {
    super.onInit();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    final PackageInfo packageInfo = PackageInfo(
      appName: info.appName,
      packageName: info.packageName,
      version: info.version,
      buildNumber: info.buildNumber,
      buildSignature: info.buildSignature,
    );

    _version(packageInfo.version);
  }

  Future<void> updateDisplayName() async {
    if (formKey.currentState!.validate()) {
      _loader.toggle();
      Get.back<dynamic>();
      await _userService.updateDisplayName(nameEC.text.trim());
    }
  }

  Future<void> updatePhotoProfile() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    final File file = File(image!.path);

    _loader.toggle();
    await _userService.updatePhotoProfile(file, user!.uid);
  }

  Future<void> signOut() async {
    _userService.signOut();
  }
}
