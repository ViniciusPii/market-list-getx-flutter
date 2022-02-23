import 'package:flutter/material.dart';
import 'package:market_list/theme/app_colors.dart';
import 'package:market_list/theme/app_fonts.dart';

class AlertDialogComponent extends StatelessWidget {
  const AlertDialogComponent({
    Key? key,
    required this.title,
    required this.content,
    required this.primaryButtonText,
    required this.primaryFunction,
    required this.secondaryButtonText,
    required this.secondaryFunction,
  }) : super(key: key);

  final String title;
  final String content;
  final String primaryButtonText;
  final Function() primaryFunction;
  final String secondaryButtonText;
  final Function() secondaryFunction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: AppFonts.size_5(color: AppColors.primary),
      ),
      content: Text(
        content,
        style: AppFonts.size_3(color: AppColors.textLightColor),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: primaryFunction,
          child: Text(primaryButtonText),
          style: TextButton.styleFrom(
            textStyle: AppFonts.size_3(),
            primary: AppColors.textColor,
          ),
        ),
        TextButton(
          onPressed: secondaryFunction,
          child: Text(secondaryButtonText),
          style: TextButton.styleFrom(
            textStyle: AppFonts.size_3(),
            primary: AppColors.white,
            backgroundColor: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
