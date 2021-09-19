import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:market_list/repositories/product_list_repository.dart';
import 'package:market_list/routes/app_routes.dart';
import 'package:market_list/theme/app_theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductListRepository>(
      create: (_) => ProductListRepository(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme(context).defaultTheme,
        routes: AppRoutes.appRoutes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
