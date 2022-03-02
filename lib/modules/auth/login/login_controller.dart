import 'dart:developer';

import 'package:get/get.dart';
import 'package:market_list/services/user/user_service.dart';

class LoginController extends GetxController {
  LoginController({
    required UserService userService,
  }) : _userService = userService;

  final UserService _userService;

  final RxBool _loading = RxBool(false);

  bool get loading => _loading.value;

  Future<void> login() async {
    try {
      _loading.toggle();
      await _userService.login();
    } catch (e) {
      _loading.toggle();
      log('Error $e');
    }
  }
}
