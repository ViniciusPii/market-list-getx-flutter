import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/components/status_bar_component.dart';
import 'package:market_list/theme/app_dimension.dart';
import 'package:market_list/theme/app_extension.dart';
import 'package:market_list/theme/app_fonts.dart';
import 'package:market_list/theme/app_icons.dart';
import './login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBarComponent(
      child: Scaffold(
        backgroundColor: AppExtension.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Faça seu login!',
                style: AppFonts.titleMedium(),
              ),
              const SizedBox(height: AppDimension.size_1),
              Text(
                'É rapidinho ;)',
                style: AppFonts.bodyLarge(color: AppExtension.textLightColor),
              ),
              const SizedBox(height: AppDimension.size_6),
              Obx(
                () => controller.loading.value
                    ? Container(
                        width: AppDimension.size_3,
                        height: AppDimension.size_3,
                        child: CircularProgressIndicator(
                          color: AppExtension.primary,
                        ),
                      )
                    : Container(
                        width: Get.width * .9,
                        child: ElevatedButton.icon(
                          onPressed: () => controller.login(),
                          icon: const Icon(AppIcons.google),
                          label: const Text(
                            'Faça Login com o Google!',
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: AppExtension.primary,
                            textStyle: AppFonts.bodyMedium(),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
