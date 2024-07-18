import 'package:delivery_app/shared/widgets/widget_without_splash.dart';
import 'package:flutter/material.dart';

class CustomCheckboxListtile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool value;
  final void Function(bool?)? onChanged;
  const CustomCheckboxListtile(
      {super.key,
      required this.title,
      this.subtitle,
      required this.value,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return WidgetWithoutSplash(
        child: CheckboxListTile(
            subtitle: null != subtitle ? Text(subtitle!) : null,
            title: Text(title),
            value: value,
            onChanged: onChanged));
  }
}
