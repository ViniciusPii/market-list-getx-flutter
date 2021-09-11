import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:market_list/theme/app_colors.dart';
import 'package:market_list/theme/app_dimension.dart';

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
            color: AppColors.pink[400]!,
            blurRadius: 10,
            offset: const Offset(3, 3),
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimension.dm_32),
        ),
      ),
      child: FloatingActionButton(
        onPressed: action,
        elevation: 0,
        child: const Icon(
          FontAwesomeIcons.plus,
          size: AppDimension.dm_16,
        ),
      ),
    );
  }
}
