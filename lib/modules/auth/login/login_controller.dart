import 'dart:developer';

import 'package:get/get.dart';
import 'package:market_list/services/user/user_service.dart';

class LoginController extends GetxController {
  LoginController({
    required UserService userService,
  }) : _userService = userService;

  final UserService _userService;

  final RxBool _loader = RxBool(false);

  bool get loader => _loader.value;

  Future<void> login() async {
    try {
      _loader.toggle();
      await _userService.login();
    } catch (e) {
      _loader.toggle();
      log('Error $e');
    }
  }
}
