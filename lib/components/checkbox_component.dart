import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:market_list/theme/app_colors.dart';
import 'package:market_list/theme/app_dimension.dart';
import 'package:market_list/theme/app_fonts.dart';

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
            height: AppDimension.dm_24,
            width: AppDimension.dm_24,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : null,
              border: isSelected
                  ? Border.all(color: AppColors.pink[400]!)
                  : Border.all(color: AppColors.neutral[600]!),
              borderRadius: BorderRadius.circular(AppDimension.dm_16),
            ),
            child: isSelected
                ? const Icon(
                    FontAwesomeIcons.check,
                    color: AppColors.white,
                    size: iconSize,
                  )
                : null,
          ),
          const SizedBox(width: AppDimension.dm_16),
          Text(
            label,
            style: AppFonts.size_4(
              color: AppColors.neutral[600],
            ),
          ),
        ],
      ),
    );
  }
}
