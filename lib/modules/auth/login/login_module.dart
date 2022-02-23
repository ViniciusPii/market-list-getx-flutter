import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'login_bindings.dart';
import 'login_page.dart';

class LoginModule {
  final GetPage<WidgetBuilder> route = GetPage<WidgetBuilder>(
    name: '/login',
    page: () => const LoginPage(),
    binding: LoginBindings(),
  );
}
