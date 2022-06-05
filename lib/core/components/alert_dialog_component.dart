import 'package:flutter/material.dart';
import 'package:market_list/core/theme/app_colors.dart';
import 'package:market_list/core/theme/app_extension.dart';
import 'package:market_list/core/theme/app_fonts.dart';

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
        style: AppFonts.headlineSmall(color: AppExtension.primary),
      ),
      content: Text(
        content,
        style: AppFonts.bodyLarge(),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: primaryFunction,
          child: Text(primaryButtonText),
          style: TextButton.styleFrom(
            textStyle: AppFonts.bodyMedium(),
            primary: AppExtension.textColor,
          ),
        ),
        TextButton(
          onPressed: secondaryFunction,
          child: Text(secondaryButtonText),
          style: TextButton.styleFrom(
            textStyle: AppFonts.bodyMedium(),
            primary: AppColors.white,
            backgroundColor: AppExtension.primary,
          ),
        ),
      ],
    );
  }
}
