import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/widgets/shimmer.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final bool isLoading;
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
      this.onTap,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? _widgetIsloading(context)
        : GestureDetector(
            onTap: onTap,
            child: Container(
                margin: const EdgeInsets.only(bottom: 5),
                height: height,
                padding: padding ??
                    const EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 15),
                width: width,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: context.themeColors.appContainerShadow,
                          blurRadius: 4,
                          blurStyle: BlurStyle.normal,
                          offset: const Offset(3, 2))
                    ],
                    borderRadius: BorderRadius.circular(borderradius ?? 15),
                    color: context.themeColors.appContainerBackground),
                child: child));
  }

  Widget _widgetIsloading(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 5),
        height: height,
        padding: padding ??
            const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 15),
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderradius ?? 15),
            color: context.themeColors.appContainerBackground,
            boxShadow: [
              BoxShadow(
                  color: context.themeColors.appContainerShadow,
                  blurRadius: 4,
                  offset: const Offset(3, 2))
            ]),
        child: Column(children: [
          Expanded(
              child: CustomShimmer(
                  width: width / 2, child: const CircleAvatar(radius: 55))),
          CustomShimmer(width: width / 2),
          const SizedBox(height: 5),
          CustomShimmer(width: width / 2.5)
        ]));
  }
}
