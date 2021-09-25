import 'package:flutter/material.dart';
import 'package:market_list/models/product_model.dart';
import 'package:market_list/pages/forms/edit_product_page.dart';
import 'package:market_list/pages/forms/save_product_page.dart';
import 'package:market_list/pages/home/home_page.dart';

class AppRoutes {
  AppRoutes._();

  static Map<String, WidgetBuilder> appRoutes = <String, WidgetBuilder>{
    // default
    '/': (_) => const HomePage(),
    // app
    '/save': (_) => const SaveProductPage(),
    '/edit': (BuildContext context) =>
        EditProductPage(product: ModalRoute.of(context)!.settings.arguments as ProductModel),
  };
}
