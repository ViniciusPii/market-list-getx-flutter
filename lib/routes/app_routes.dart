import 'package:flutter/material.dart';
import 'package:market_list/pages/forms/form_page.dart';
import 'package:market_list/pages/home/home_page.dart';

class AppRoutes {
  AppRoutes._();

  static Map<String, WidgetBuilder> appRoutes = <String, WidgetBuilder>{
    // default
    '/': (_) => const HomePage(),
    // app
    '/forms': (_) => const FormPage(),
    //auth
  };
}
