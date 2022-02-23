import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/components/status_bar_component.dart';
import 'package:market_list/theme/app_colors.dart';
import 'package:market_list/theme/app_dimension.dart';
import 'package:market_list/theme/app_fonts.dart';
import './splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBarComponent(
      brightness: Brightness.light,
      child: Scaffold(
        body: Container(
          color: AppColors.primary,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimension.dm_24),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Olá!',
                    style: AppFonts.sizeBold_10(color: AppColors.white),
                  ),
                  const SizedBox(height: AppDimension.dm_16),
                  Text(
                    'Seja bem vindo(a) ao Market List!',
                    style: AppFonts.size_8(color: AppColors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
