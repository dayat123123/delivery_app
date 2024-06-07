import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double width;
  const CustomShimmer(
      {super.key, this.child, required this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        direction: ShimmerDirection.ltr,
        highlightColor: context.themeColors.appContainerShadow,
        baseColor: context.themeColors.appContainerShadow.withOpacity(0.3),
        child: child ??
            Container(
                    height: height ?? 20,
                    decoration: BoxDecoration(
                        color: context.themeColors.appContainerBackground,
                        borderRadius: BorderRadius.circular(3)),
                    width: width)
                .centerLeft);
  }
}
