import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:market_list/components/text_input_component.dart';
import 'package:market_list/theme/app_colors.dart';
import 'package:market_list/theme/app_dimension.dart';
import 'package:market_list/theme/app_fonts.dart';
import 'package:market_list/utils/masks/text_input_masks.dart';
import 'package:market_list/utils/validators/form_validators.dart';
import './edit_controller.dart';

class EditPage extends GetView<EditController> {
  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.celeste[200],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimension.dm_16,
              horizontal: AppDimension.dm_24,
            ),
            child: Form(
              key: controller.form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Você está alterando ${controller.product.productName}!',
                    style: AppFonts.size_4(
                      weight: FontWeight.bold,
                      color: AppColors.neutral[700],
                    ),
                  ),
                  const SizedBox(height: AppDimension.dm_32),
                  TextInputComponent(
                    label: 'Produto',
                    hint: 'Ex: Tomate',
                    formatters: <TextInputFormatter>[
                      TextInputMasks.productNameMask,
                    ],
                    validators: FormValidators.checkNotEmptyProductName,
                    controller: controller.productEC,
                  ),
                  const SizedBox(height: AppDimension.dm_8),
                  if (controller.product.isSelected)
                    TextInputComponent(
                      label: 'Peso',
                      hint: 'Ex: Kg 0,500',
                      formatters: <TextInputFormatter>[
                        TextInputMasks.weightMask,
                      ],
                      type: TextInputType.number,
                      validators: FormValidators.checkWeight,
                      controller: controller.weightEC,
                    )
                  else
                    TextInputComponent(
                      label: 'Quantidade',
                      hint: 'Ex: 1',
                      formatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      type: TextInputType.number,
                      validators: FormValidators.checkAmount,
                      controller: controller.quantityEC,
                    ),
                  const SizedBox(height: AppDimension.dm_8),
                  TextInputComponent(
                    label: 'Preço',
                    hint: 'Ex: R\$ 2,50',
                    formatters: <TextInputFormatter>[
                      TextInputMasks.currencyMask,
                    ],
                    type: TextInputType.number,
                    validators: FormValidators.checkPrice,
                    controller: controller.priceEC,
                  ),
                  const SizedBox(height: AppDimension.dm_24),
                  Obx(
                    () => controller.loading.value
                        ? Container(
                            width: AppDimension.dm_24,
                            height: AppDimension.dm_24,
                            child: CircularProgressIndicator(
                              color: AppColors.pink[400],
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () => controller.editProduct(),
                            child: const Text('Editar'),
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.pink[400],
                              textStyle: AppFonts.size_3(),
                            ),
                          ),
                  ),
                  const SizedBox(height: AppDimension.dm_16),
                  TextButton(
                    onPressed: () => Get.back<dynamic>(),
                    child: const Text('Voltar ao inicio'),
                    style: TextButton.styleFrom(
                      primary: AppColors.pink[400],
                      textStyle: AppFonts.size_3(),
                    ),
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
