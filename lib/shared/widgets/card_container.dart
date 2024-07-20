import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:delivery_app/shared/widgets/shimmer.dart';
import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final double borderRadius;
  final Color? color;
  final Color? splashColor;
  final BoxBorder? border;
  final BoxConstraints? constraints;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final CardContainerShape shape;
  final bool isLoading;
  final bool withBorder;
  final bool withBottomMargin;
  const CardContainer(
      {super.key,
      required this.child,
      this.onTap,
      this.height,
      this.width,
      this.alignment = Alignment.center,
      this.padding,
      this.border,
      this.onLongPress,
      this.borderRadius = StyleHelpers.borderRadius,
      this.constraints,
      this.color,
      this.splashColor,
      this.shape = CardContainerShape.rounded,
      this.isLoading = false,
      this.withBorder = true,
      this.withBottomMargin = true});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: withBottomMargin ? const EdgeInsets.only(bottom: 3) : null,
        decoration: _boxDecoration(context, withBorder),
        child: Material(
            shape: _shapeBorder(),
            color: !withBorder
                ? null
                : color ?? context.themeColors.appContainerBackground,
            borderRadius: _borderRadiusGeometry(),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
                onTap: onTap,
                onLongPress: onLongPress,
                splashColor:
                    splashColor ?? context.theme.primaryColor.withOpacity(0.05),
                hoverColor:
                    splashColor ?? context.theme.primaryColor.withOpacity(0.05),
                highlightColor:
                    splashColor ?? context.theme.primaryColor.withOpacity(0.05),
                splashFactory: InkSplash.splashFactory,
                child: Container(
                    padding: padding,
                    alignment: alignment,
                    constraints: constraints,
                    width: width,
                    height: height,
                    child: isLoading ? _isLoadingwidget(context) : child))));
  }

  Widget _isLoadingwidget(BuildContext context) {
    return Column(children: [
      Expanded(
          child: CustomShimmer(
              width: context.fullWidth,
              child: Container(
                color: Colors.black,
              ))),
      Wrap(children: [
        CustomShimmer(width: context.fullWidth * 0.2),
        const SizedBox(height: 25),
        CustomShimmer(width: context.fullWidth)
      ]).paddingAll(StyleHelpers.allPaddingNumber)
    ]);
  }

  BorderRadiusGeometry? _borderRadiusGeometry() {
    switch (shape) {
      case CardContainerShape.rounded:
        return BorderRadius.circular(borderRadius);
      default:
    }
    return null;
  }

  ShapeBorder? _shapeBorder() {
    switch (shape) {
      case CardContainerShape.circle:
        return const CircleBorder();
      default:
    }
    return null;
  }

  BoxDecoration? _boxDecoration(BuildContext context, bool withBorder) {
    switch (shape) {
      case CardContainerShape.rounded:
        return BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color:
                      context.themeColors.appContainerShadow.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(1, 1))
            ],
            border: withBorder
                ? Border.all(width: 0.25, color: context.themeColors.border)
                : null,
            borderRadius: BorderRadius.circular(borderRadius));
      default:
        return null;
    }
  }
}

enum CardContainerShape { rounded, circle }
