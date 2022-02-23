import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/modules/edit/edit_module.dart';
import 'package:market_list/modules/home/home_module.dart';
import 'package:market_list/modules/login/login_module.dart';
import 'package:market_list/modules/save/save_module.dart';
import 'package:market_list/modules/splash/splash_module.dart';
import 'package:market_list/theme/app_theme.dart';

import 'application/app_binding.dart';

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
