import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:market_list/modules/login/login_bindings.dart';
import 'package:market_list/modules/login/login_page.dart';

class LoginModule {
  final GetPage<WidgetBuilder> route = GetPage<WidgetBuilder>(
    name: '/login',
    page: () => const LoginPage(),
    binding: LoginBindings(),
  );
}
