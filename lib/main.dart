import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/theme/app_theme.dart';

import 'core/bindings/app_binding.dart';

import 'modules/app/edit/edit_module.dart';
import 'modules/app/home/home_module.dart';
import 'modules/app/save/save_module.dart';
import 'modules/app/splash/splash_module.dart';
import 'modules/auth/login/login_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        EditModule().route,
      ],
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
    );
  }
}
