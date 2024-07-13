import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/misc/spacer_helpers.dart';
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
      this.borderRadius = SpacerHelper.borderRadius,
      this.constraints,
      this.color,
      this.splashColor,
      this.shape = CardContainerShape.rounded,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Material(
        shape: _shapeBorder(),
        color: color ?? context.themeColors.appContainerBackground,
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
                decoration: _boxDecoration(context),
                width: width,
                height: height,
                child: isLoading ? _isLoadingwidget(context) : child)));
  }

  Widget _isLoadingwidget(BuildContext context) {
    return Column(children: [
      Expanded(
          child: CustomShimmer(
              width: context.fullWidth, child: const CircleAvatar(radius: 55))),
      CustomShimmer(width: context.fullWidth * 0.2),
      const SizedBox(height: 5),
      CustomShimmer(width: context.fullWidth)
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

  BoxDecoration? _boxDecoration(BuildContext context) {
    switch (shape) {
      case CardContainerShape.rounded:
        return BoxDecoration(
            border: Border.all(width: 0.5, color: context.themeColors.border),
            borderRadius: BorderRadius.circular(borderRadius));
      default:
    }
    return null;
  }
}

enum CardContainerShape { rounded, circle }
