import 'package:flutter/material.dart';
import 'package:market_list/core/theme/app_extension.dart';

class AppBarComponent extends AppBar {
  AppBarComponent({
    Key? key,
    required String title,
  }) : super(
          key: key,
          elevation: 0,
          centerTitle: true,
          title: Text(title),
          backgroundColor: AppExtension.background,
          foregroundColor: AppExtension.textColor,
        );
}
