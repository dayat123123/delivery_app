import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final double width;
  final double? height;
  final double? borderradius;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;
  const CustomCard(
      {super.key,
      required this.child,
      this.padding,
      this.height,
      required this.width,
      this.borderradius,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            height: height,
            padding: padding ??
                const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 15),
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderradius ?? 10),
                color: context.themeColors.appContainerBackground),
            child: child));
  }
}
