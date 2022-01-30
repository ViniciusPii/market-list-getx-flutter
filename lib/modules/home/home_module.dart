import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:market_list/modules/home/home_bindings.dart';
import 'package:market_list/modules/home/home_page.dart';

class HomeModule {
  final GetPage<WidgetBuilder> route = GetPage<WidgetBuilder>(
    name: '/home',
    page: () => const HomePage(),
    binding: HomeBindings(),
  );
}
