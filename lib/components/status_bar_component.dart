import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarComponent extends StatelessWidget {
  const StatusBarComponent({
    Key? key,
    required this.child,
    this.brightness = Brightness.dark,
  }) : super(key: key);

  final Widget child;
  final Brightness? brightness;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: brightness,
      ),
      child: child,
    );
  }
}
