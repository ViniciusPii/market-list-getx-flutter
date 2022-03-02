import 'dart:developer';

import 'package:get/get.dart';
import 'package:market_list/services/user/user_service.dart';

class LoginController extends GetxController {
  LoginController({
    required UserService userService,
  }) : _userService = userService;

  final UserService _userService;

  final RxBool loading = RxBool(false);

  Future<void> login() async {
    try {
      loading.toggle();
      await _userService.login();
    } catch (e) {
      loading.toggle();
      log('Error $e');
    }
  }
}
