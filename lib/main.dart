import 'package:flutter/material.dart';
import 'package:market_list/pages/home/home_page.dart';
import 'package:market_list/repositories/product_list_repository.dart';
import 'package:market_list/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductListRepository>(
      create: (_) => ProductListRepository(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme(context).defaultTheme,
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
