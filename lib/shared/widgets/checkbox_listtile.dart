import 'package:delivery_app/shared/widgets/widget_without_splash.dart';
import 'package:flutter/material.dart';

class CustomCheckboxListtile extends StatelessWidget {
  final String? title;
  final Widget? titleChild;
  final String? subtitle;
  final bool value;
  final void Function(bool?)? onChanged;
  final ListTileControlAffinity controlAffinity;
  final bool isThreeLine;
  final EdgeInsetsGeometry? contentPadding;
  const CustomCheckboxListtile(
      {super.key,
      this.title,
      this.subtitle,
      required this.value,
      this.onChanged,
      this.titleChild,
      this.controlAffinity = ListTileControlAffinity.platform,
      this.isThreeLine = false,
      this.contentPadding});

  @override
  Widget build(BuildContext context) {
    return WidgetWithoutSplash(
        child: CheckboxListTile(
            isThreeLine: isThreeLine,
            controlAffinity: controlAffinity,
            contentPadding: contentPadding,
            subtitle: null != subtitle ? Text(subtitle!) : null,
            title: titleChild ??
                Text(title ?? "",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500)),
            value: value,
            onChanged: onChanged));
  }
}
