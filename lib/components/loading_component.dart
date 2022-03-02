import 'package:flutter/material.dart';
import 'package:market_list/theme/app_dimension.dart';
import 'package:market_list/theme/app_extension.dart';

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({
    Key? key,
    required this.child,
    this.loading = false,
  }) : super(key: key);

  final Widget child;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: loading,
      replacement: child,
      child: Container(
        width: AppDimension.size_3,
        height: AppDimension.size_3,
        child: CircularProgressIndicator(
          color: AppExtension.primary,
        ),
      ),
    );
  }
}
