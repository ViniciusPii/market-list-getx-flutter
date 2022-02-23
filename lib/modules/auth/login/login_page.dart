import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:market_list/components/status_bar_component.dart';
import 'package:market_list/theme/app_colors.dart';
import 'package:market_list/theme/app_dimension.dart';
import 'package:market_list/theme/app_fonts.dart';
import './login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBarComponent(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Faça seu login!',
                style: AppFonts.size_8(),
              ),
              const SizedBox(height: AppDimension.dm_8),
              Text(
                'É rapidinho ;)',
                style: AppFonts.size_4(color: AppColors.textLightColor),
              ),
              const SizedBox(height: AppDimension.dm_48),
              Obx(
                () => controller.loading.value
                    ? Container(
                        width: AppDimension.dm_24,
                        height: AppDimension.dm_24,
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      )
                    : Container(
                        width: Get.width * .9,
                        child: ElevatedButton.icon(
                          onPressed: () => controller.login(),
                          icon: const Icon(FontAwesomeIcons.google),
                          label: const Text(
                            'Faça Login com o Google!',
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.primary,
                            textStyle: AppFonts.size_3(),
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
