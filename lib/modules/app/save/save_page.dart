import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:market_list/core/components/app_bar_component.dart';
import 'package:market_list/core/components/checkbox_component.dart';
import 'package:market_list/core/components/loading_component.dart';
import 'package:market_list/core/components/text_input_component.dart';
import 'package:market_list/core/utils/masks/text_input_masks.dart';
import 'package:market_list/core/utils/validators/form_validators.dart';
import 'package:market_list/core/theme/app_dimension.dart';
import 'package:market_list/core/theme/app_extension.dart';
import 'package:market_list/core/theme/app_fonts.dart';
import './save_controller.dart';

class SavePage extends GetView<SaveController> {
  const SavePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppExtension.background,
      appBar: AppBarComponent(
        title: controller.product != null ? 'Editar' : 'Cadastrar',
      ),
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
                      controller.product != null
                          ? 'Alterando ${controller.product!.productName}!'
                          : 'Adicione seu produto!',
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
                    Visibility(
                      visible: controller.selected ||
                          (controller.product != null && controller.product!.isSelected),
                      child: TextInputComponent(
                        label: 'Peso',
                        hint: 'Ex: Kg 0,500',
                        formatters: <TextInputFormatter>[
                          TextInputMasks.weightMask,
                        ],
                        focus: controller.focus,
                        type: TextInputType.number,
                        controller: controller.weightEC,
                        validators: FormValidators.checkWeight,
                      ),
                      replacement: TextInputComponent(
                        label: 'Quantidade',
                        hint: 'Ex: 1',
                        formatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        focus: controller.focus,
                        type: TextInputType.number,
                        controller: controller.quantityEC,
                        validators: FormValidators.checkAmount,
                      ),
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
                    Visibility(
                      visible: controller.product == null,
                      child: CheckboxComponent(
                        action: () => controller.isSelected(),
                        isSelected: controller.selected,
                        label: 'Calcular por peso',
                      ),
                    ),
                    const SizedBox(height: AppDimension.size_3),
                    LoadingComponent(
                      loading: controller.loader,
                      child: ElevatedButton(
                        onPressed: () => controller.saveProduct(),
                        child: const Text('Adicionar'),
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
