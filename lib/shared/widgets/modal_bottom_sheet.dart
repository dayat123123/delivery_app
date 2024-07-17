import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:flutter/material.dart';

class CustomModalBottomSheet extends StatelessWidget {
  final Widget? header;
  final Widget child;
  final double? initialChildSize;
  final double? maxChildSize;
  final double? minChildSize;
  final bool? isScrollChild;
  const CustomModalBottomSheet(
      {super.key,
      this.header,
      required this.child,
      this.initialChildSize,
      this.maxChildSize,
      this.minChildSize,
      this.isScrollChild});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: false,
        initialChildSize: initialChildSize ?? 0.7,
        minChildSize: minChildSize ?? 0.25,
        maxChildSize: maxChildSize ?? 1,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
              decoration: BoxDecoration(
                  color: context.themeColors.appContainerBackground,
                  borderRadius: StyleHelpers.topRadius),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                if (header != null) header!,
                Expanded(
                    child: SingleChildScrollView(
                        physics: isScrollChild ?? true
                            ? const BouncingScrollPhysics()
                            : const NeverScrollableScrollPhysics(),
                        controller: scrollController,
                        child: child))
              ]));
        });
  }
}
