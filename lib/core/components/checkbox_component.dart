import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:market_list/core/theme/app_colors.dart';
import 'package:market_list/core/theme/app_dimension.dart';
import 'package:market_list/core/theme/app_extension.dart';
import 'package:market_list/core/theme/app_fonts.dart';

class CheckboxComponent extends StatelessWidget {
  const CheckboxComponent({
    Key? key,
    this.isSelected = false,
    required this.action,
    required this.label,
  }) : super(key: key);

  final bool isSelected;
  final Function() action;
  final String label;

  static const double iconSize = 12;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Row(
        children: <Widget>[
          Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: isSelected ? AppExtension.primary : null,
              border: isSelected
                  ? Border.all(color: AppExtension.primary)
                  : Border.all(color: AppExtension.textLightColor),
              borderRadius: BorderRadius.circular(AppDimension.size_2),
            ),
            child: isSelected
                ? Icon(
                    EvaIcons.checkmark,
                    color: AppColors.white,
                    size: iconSize,
                  )
                : null,
          ),
          const SizedBox(width: AppDimension.size_2),
          Text(
            label,
            style: AppFonts.bodyMedium(
              color: AppExtension.textLightColor,
            ),
          ),
        ],
      ),
    );
  }
}
