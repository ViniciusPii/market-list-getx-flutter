import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'home_bindings.dart';
import 'home_page.dart';

class HomeModule {
  final GetPage<WidgetBuilder> route = GetPage<WidgetBuilder>(
    name: '/home',
    page: () => const HomePage(),
    binding: HomeBindings(),
  );
}
