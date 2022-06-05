import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/bindings/app_binding.dart';
import 'modules/app/home/home_module.dart';
import 'modules/app/save/save_module.dart';
import 'modules/app/splash/splash_module.dart';
import 'modules/app/user_details/user_details_module.dart';
import 'modules/auth/login/login_module.dart';
import 'core/theme/app_theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.defaultTheme,
      getPages: <GetPage<WidgetBuilder>>[
        SplashModule().route,
        LoginModule().route,
        HomeModule().route,
        SaveModule().route,
        UserDetailsModule().route,
      ],
      initialRoute: '/splash',
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
