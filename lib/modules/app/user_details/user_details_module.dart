import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'user_details_bindings.dart';
import 'user_details_page.dart';

class UserDetailsModule {
  final GetPage<WidgetBuilder> route = GetPage<WidgetBuilder>(
    name: '/user/details',
    page: () => const UserDetailsPage(),
    binding: UserDetailsBindings(),
  );
}
