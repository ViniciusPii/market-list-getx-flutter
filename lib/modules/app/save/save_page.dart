import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:market_list/components/checkbox_component.dart';
import 'package:market_list/components/text_input_component.dart';
import 'package:market_list/core/utils/masks/text_input_masks.dart';
import 'package:market_list/core/utils/validators/form_validators.dart';
import 'package:market_list/theme/app_dimension.dart';
import 'package:market_list/theme/app_extension.dart';
import 'package:market_list/theme/app_fonts.dart';
import './save_controller.dart';

class SavePage extends GetView<SaveController> {
  const SavePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppExtension.background,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimension.size_2,
              horizontal: AppDimension.size_3,
            ),
            child: Obx(
              () => Form(
                key: controller.form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Adicione seu produto!',
                      style: AppFonts.titleMedium(
                        color: AppExtension.textColor,
                      ),
                    ),
                    const SizedBox(height: AppDimension.size_4),
                    TextInputComponent(
                      label: 'Produto',
                      hint: 'Ex: Tomate',
                      formatters: <TextInputFormatter>[
                        TextInputMasks.onlyLetters,
                      ],
                      controller: controller.productEC,
                      validators: FormValidators.checkNotEmptyProductName,
                    ),
                    const SizedBox(height: AppDimension.size_2),
                    if (controller.selected)
                      TextInputComponent(
                        label: 'Peso',
                        hint: 'Ex: Kg 0,500',
                        formatters: <TextInputFormatter>[
                          TextInputMasks.weightMask,
                        ],
                        type: TextInputType.number,
                        controller: controller.weightEC,
                        validators: FormValidators.checkWeight,
                      )
                    else
                      TextInputComponent(
                        label: 'Quantidade',
                        hint: 'Ex: 1',
                        formatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        type: TextInputType.number,
                        controller: controller.quantityEC,
                        validators: FormValidators.checkAmount,
                      ),
                    const SizedBox(height: AppDimension.size_2),
                    TextInputComponent(
                      label: 'Preço',
                      hint: 'Ex: R\$ 2,50',
                      formatters: <TextInputFormatter>[
                        TextInputMasks.currencyMask,
                      ],
                      type: TextInputType.number,
                      controller: controller.priceEC,
                      validators: FormValidators.checkPrice,
                    ),
                    const SizedBox(height: AppDimension.size_2),
                    CheckboxComponent(
                      action: () {
                        controller.isSelected();
                      },
                      isSelected: controller.selected,
                      label: 'Calcular por peso',
                    ),
                    const SizedBox(height: AppDimension.size_3),
                    if (controller.loading)
                      Container(
                        width: AppDimension.size_3,
                        height: AppDimension.size_3,
                        child: CircularProgressIndicator(
                          color: AppExtension.primary,
                        ),
                      )
                    else
                      ElevatedButton(
                        onPressed: () => controller.saveProduct(),
                        child: const Text('Adicionar'),
                        style: ElevatedButton.styleFrom(
                          textStyle: AppFonts.bodyMedium(),
                        ),
                      ),
                    const SizedBox(height: AppDimension.size_2),
                    TextButton(
                      onPressed: () => Get.back<dynamic>(),
                      child: const Text('Voltar ao inicio'),
                      style: TextButton.styleFrom(
                        textStyle: AppFonts.bodyMedium(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
