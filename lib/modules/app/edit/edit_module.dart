import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'edit_bindings.dart';
import 'edit_page.dart';

class EditModule {
  final GetPage<WidgetBuilder> route = GetPage<WidgetBuilder>(
    name: '/edit',
    page: () => const EditPage(),
    binding: EditBindings(),
  );
}