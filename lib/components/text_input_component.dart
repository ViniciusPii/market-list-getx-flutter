import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market_list/theme/app_colors.dart';
import 'package:market_list/theme/app_extension.dart';
import 'package:market_list/theme/app_fonts.dart';

class TextInputComponent extends StatelessWidget {
  const TextInputComponent({
    Key? key,
    required this.label,
    required this.hint,
    this.controller,
    this.formatters,
    this.type = TextInputType.text,
    this.validators,
  }) : super(key: key);

  final TextEditingController? controller;
  final String label;
  final String? hint;
  final List<TextInputFormatter>? formatters;
  final TextInputType type;
  final String? Function(String?)? validators;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: AppFonts.bodyLarge(),
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        hintText: hint,
        labelText: label,
        fillColor: AppColors.white,
        labelStyle: AppFonts.bodyLarge(color: AppExtension.primary),
        hintStyle: AppFonts.bodyLarge(color: AppColors.neutral.shade400),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppExtension.primary),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppExtension.primary),
        ),
      ),
      autofocus: true,
      keyboardType: type,
      validator: validators,
      inputFormatters: formatters,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.sentences,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
