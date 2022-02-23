import 'dart:developer';

import 'package:get/get.dart';
import 'package:market_list/repositories/login_repository.dart';

class LoginController extends GetxController {
  LoginController({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository;

  final LoginRepository _loginRepository;

  final RxBool loading = RxBool(false);

  Future<void> login() async {
    try {
      loading.toggle();
      await _loginRepository.login();
    } catch (e) {
      loading.toggle();
      log('Error $e');
    }
  }
}
