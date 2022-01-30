import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:market_list/modules/splash/splash_bindings.dart';
import 'package:market_list/modules/splash/splash_page.dart';

class SplashModule {
  final GetPage<WidgetBuilder> route = GetPage<WidgetBuilder>(
    name: '/',
    page: () => const SplashPage(),
    binding: SplashBindings(),
  );
}
