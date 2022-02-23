import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'save_bindings.dart';
import 'save_page.dart';

class SaveModule {
  final GetPage<WidgetBuilder> route = GetPage<WidgetBuilder>(
    name: '/save',
    page: () => const SavePage(),
    binding: SaveBindings(),
  );
}
