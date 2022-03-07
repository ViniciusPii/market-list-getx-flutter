import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/components/loading_component.dart';
import 'package:market_list/components/status_bar_component.dart';
import 'package:market_list/theme/app_dimension.dart';
import 'package:market_list/theme/app_extension.dart';
import 'package:market_list/theme/app_fonts.dart';
import './login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBarComponent(
      child: Scaffold(
        backgroundColor: AppExtension.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimension.size_2,
            horizontal: AppDimension.size_3,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: AppDimension.size_2,
                ),
                Text(
                  'MarketList',
                  style: AppFonts.titleLarge(),
                ),
                const SizedBox(
                  height: AppDimension.size_2,
                ),
                Image.asset('assets/images/login.png'),
                const SizedBox(
                  height: AppDimension.size_3,
                ),
                Text(
                  'Login',
                  style: AppFonts.titleLarge(),
                ),
                Text(
                  'Faça seu login e aproveite!',
                  style: AppFonts.bodyLarge(
                    color: AppExtension.textLightColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppDimension.size_6,
                ),
                Obx(
                  () => LoadingComponent(
                    loading: controller.loader,
                    child: ElevatedButton.icon(
                      onPressed: () => controller.login(),
                      icon: const Icon(EvaIcons.google),
                      label: const Text(
                        'Login com o Google!',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
