import 'package:flutter/material.dart';
import 'package:market_list/theme/app_dimension.dart';
import 'package:market_list/theme/app_extension.dart';
import 'package:market_list/theme/app_icons.dart';

class FloatingButtonComponent extends StatelessWidget {
  const FloatingButtonComponent({
    Key? key,
    required this.action,
  }) : super(key: key);

  final Function() action;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppExtension.primary,
            blurRadius: 10,
            offset: const Offset(3, 3),
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimension.size_4),
        ),
      ),
      child: FloatingActionButton(
        backgroundColor: AppExtension.primary,
        onPressed: action,
        elevation: 0,
        child: const Icon(
          AppIcons.plus,
          size: AppDimension.size_2,
        ),
      ),
    );
  }
}
