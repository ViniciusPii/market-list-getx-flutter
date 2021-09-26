import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market_list/theme/app_colors.dart';
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
      style: AppFonts.size_3(),
      decoration: InputDecoration(
        fillColor: AppColors.white,
        filled: true,
        isDense: true,
        labelText: label,
        labelStyle: AppFonts.size_3(color: AppColors.pink[300]),
        hintText: hint,
        hintStyle: AppFonts.size_3(color: AppColors.neutral[400]),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.pink[200]!),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.pink),
        ),
        errorStyle: AppFonts.size_1(color: AppColors.red),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validators,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: type,
      autofocus: true,
      inputFormatters: formatters,
      textInputAction: TextInputAction.next,
    );
  }
}
