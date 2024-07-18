import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class WidgetWithoutSplash extends StatelessWidget {
  final Widget child;
  const WidgetWithoutSplash({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: context.theme.copyWith(
            splashFactory: NoSplash.splashFactory,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: child);
  }
}
