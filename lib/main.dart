import 'package:flutter/material.dart';
import 'package:market_list/pages/home/home_page.dart';
import 'package:market_list/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme(context).defaultTheme,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
