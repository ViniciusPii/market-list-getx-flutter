import 'dart:developer';

import 'package:get/get.dart';
import 'package:market_list/repositories/login_repository.dart';

class LoginController extends GetxController {
  LoginController({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository;

  final LoginRepository _loginRepository;

  final RxBool loading = false.obs;

  bool isLoading() {
    return loading.value = !loading.value;
  }

  Future<void> login() async {
    isLoading();
    try {
      await _loginRepository.login();
      isLoading();
    } catch (e) {
      log('Error $e');
    } finally {
      isLoading();
    }
  }
}
