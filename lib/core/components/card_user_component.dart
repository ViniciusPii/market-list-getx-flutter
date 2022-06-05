import 'package:flutter/material.dart';
import 'package:market_list/core/theme/app_dimension.dart';
import 'package:market_list/core/theme/app_extension.dart';
import 'package:market_list/core/theme/app_fonts.dart';

class CardUserComponent extends StatelessWidget {
  const CardUserComponent({
    Key? key,
    required this.label,
    required this.title,
    this.func,
    this.icon,
  }) : super(key: key);

  final String label;
  final String title;
  final IconData? icon;
  final Function()? func;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style: AppFonts.bodySmall(
                  color: AppExtension.textLightColor,
                ),
              ),
              Text(
                title,
                style: AppFonts.titleLarge(),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: func,
          icon: Icon(
            icon,
            size: AppDimension.size_3,
            color: AppExtension.primary,
          ),
        ),
      ],
    );
  }
}
