import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:market_list/components/alert_dialog_component.dart';
import 'package:market_list/components/card_user_component.dart';
import 'package:market_list/components/loading_component.dart';
import 'package:market_list/components/status_bar_component.dart';
import 'package:market_list/components/text_input_component.dart';
import 'package:market_list/core/utils/masks/text_input_masks.dart';
import 'package:market_list/theme/app_colors.dart';
import 'package:market_list/theme/app_dimension.dart';
import 'package:market_list/theme/app_extension.dart';
import 'package:market_list/theme/app_fonts.dart';
import 'package:market_list/theme/app_icons.dart';
import 'package:validatorless/validatorless.dart';
import 'user_details_controller.dart';

class UserDetailsPage extends GetView<UserDetailsController> {
  const UserDetailsPage({Key? key}) : super(key: key);

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
          child: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Obx(
                      () => LoadingComponent(
                        loading: controller.loader,
                        child: GestureDetector(
                          onTap: () => controller.updatePhotoProfile(),
                          child: CircleAvatar(
                            backgroundColor: AppExtension.primary,
                            backgroundImage: NetworkImage('${controller.user?.photoURL}'),
                            radius: AppDimension.size_6,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppDimension.size_3,
                    ),
                    CardUserComponent(
                      label: 'Nome',
                      title: '${controller.user!.displayName}',
                      func: () => _buildBottomSheet(),
                      icon: AppIcons.pencil_1,
                    ),
                    const SizedBox(
                      height: AppDimension.size_2,
                    ),
                    CardUserComponent(
                      label: 'E-mail',
                      title: '${controller.user!.email}',
                    ),
                    const SizedBox(
                      height: AppDimension.size_6,
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(AppIcons.exit_to_app),
                      onPressed: () => showDialog<AlertDialog>(
                        context: context,
                        builder: (BuildContext context) => AlertDialogComponent(
                          title: 'Atenção!',
                          content: 'Voce deseja realmente sair?',
                          primaryButtonText: 'Não',
                          primaryFunction: () => Get.back<dynamic>(),
                          secondaryButtonText: 'Sim',
                          secondaryFunction: () => controller.signOut(),
                        ),
                      ),
                      label: const Text('Desconectar-se'),
                    ),
                    const SizedBox(
                      height: AppDimension.size_1,
                    ),
                    TextButton(
                      onPressed: () => Get.back<dynamic>(),
                      child: const Text(
                        'Voltar ao início',
                      ),
                    ),
                  ],
                ),
              ),
              const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Align(
                  child: Text('v.3.2.0'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _buildBottomSheet() {
    return Get.bottomSheet<dynamic>(
      Container(
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimension.size_2,
            horizontal: AppDimension.size_3,
          ),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () => Get.back<dynamic>(),
                    icon: Icon(
                      AppIcons.close,
                      size: AppDimension.size_3,
                      color: AppExtension.textColor,
                    ),
                    color: AppExtension.textColor,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Digite o novo nome!',
                          style: AppFonts.titleLarge(),
                        ),
                        const SizedBox(
                          height: AppDimension.size_3,
                        ),
                        TextInputComponent(
                          label: 'Nome',
                          controller: controller.nameEC,
                          hint: 'Ex: Fulano',
                          formatters: <TextInputFormatter>[TextInputMasks.onlyLetters],
                          validators: Validatorless.multiple(<String? Function(String?)>[
                            Validatorless.required('Nome é obrigatório'),
                            Validatorless.min(2, 'Nome deve conter ao menos dois caracteres')
                          ]),
                        ),
                        const SizedBox(
                          height: AppDimension.size_3,
                        ),
                        Obx(
                          () => LoadingComponent(
                            loading: controller.loader,
                            child: ElevatedButton(
                              onPressed: () => controller.updateDisplayName(),
                              child: const Text('Alterar Nome'),
                            ),
                          ),
                        ),
                      ],
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
