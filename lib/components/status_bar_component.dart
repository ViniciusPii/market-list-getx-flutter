import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarComponent extends StatelessWidget {
  const StatusBarComponent({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: child,
    );
  }
}
