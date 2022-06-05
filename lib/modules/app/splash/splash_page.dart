import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/core/components/status_bar_component.dart';
import 'package:market_list/core/theme/app_dimension.dart';
import 'package:market_list/core/theme/app_extension.dart';
import './splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBarComponent(
      brightness: Brightness.light,
      navigationColor: AppExtension.primary,
      child: Scaffold(
        body: Container(
          color: AppExtension.primary,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimension.size_3),
            child: Center(
              child: Image.asset(
                'assets/splash.png',
                height: AppDimension.size_10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
