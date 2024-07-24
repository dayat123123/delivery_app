import 'dart:io';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/card_container.dart';
import 'package:delivery_app/shared/widgets/progress_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum ButtonType {
  basic,
  textbutton,
  arrowbackbutton,
  savebutton,
  animatedbutton,
  cartButton,
  incrementAndDecrementButton,
  buttonWithTextAndIcon
}

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final double? height;
  final double? width;
  final double? fontsize;
  final double? iconsize;
  final EdgeInsetsGeometry? padding;
  final ButtonType? buttonType;
  final Color? textColor;
  final Color? buttonColor;
  final double? radius;
  final FontWeight? fontWeight;
  final bool isFavorit;
  final Widget? widgetChild;
  final IconData? iconAnimated;
  final bool? withAnimation;
  final int? initialValue;
  final void Function(int)? onChangedIncDecrButton;
  const CustomButton(
      {super.key,
      this.onPressed,
      this.text,
      this.height,
      this.width,
      this.padding,
      this.buttonType,
      this.textColor,
      this.buttonColor,
      this.fontsize,
      this.radius,
      this.fontWeight,
      this.isFavorit = false,
      this.widgetChild,
      this.iconAnimated,
      this.withAnimation,
      this.initialValue,
      this.onChangedIncDecrButton,
      this.iconsize});

  @override
  Widget build(BuildContext context) {
    return child(context);
  }

  Widget child(BuildContext context) {
    switch (buttonType) {
      case ButtonType.textbutton:
        return TextButton(
                style: _buttonStyle(buttonType, context),
                onPressed: onPressed,
                child: Text(text ?? "Submit",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontWeight: fontWeight,
                        color: textColor ?? context.theme.primaryColor,
                        fontSize: fontsize ?? 15)))
            .centerRight;
      case ButtonType.arrowbackbutton:
        return CardContainer(
            shape: CardContainerShape.circle,
            width: 45,
            height: 45,
            onTap: () => context.pop(),
            child: Icon(
                Platform.isIOS ? Icons.arrow_back_ios_new : Icons.arrow_back));
      case ButtonType.savebutton:
        return CardContainer(
            shape: CardContainerShape.circle,
            width: width,
            height: height,
            onTap: onPressed,
            child: Icon(isFavorit ? Icons.favorite : Icons.favorite_border));
      case ButtonType.animatedbutton:
        return AnimatedButton(
            withAnimation: withAnimation ?? true,
            delayedInSeconds: 1,
            sizeWhileLoading: 60,
            onPressed: onPressed,
            icon: iconAnimated,
            child: widgetChild);
      case ButtonType.cartButton:
        return CardContainer(
            onTap: onPressed,
            alignment: Alignment.center,
            height: context.fullHeight,
            width: 50,
            child: Stack(alignment: Alignment.center, children: [
              const Positioned(
                  bottom: 5, child: Icon(Icons.shopping_cart_rounded)),
              Positioned(
                  top: 5,
                  right: 0,
                  child: CircleAvatar(
                      radius: 10,
                      backgroundColor: context.theme.primaryColor,
                      child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: FittedBox(
                              fit: BoxFit.cover, child: Text(text ?? "0")))))
            ]));
      case ButtonType.incrementAndDecrementButton:
        return _QuantityIncAndDecButton(
            key: key,
            onChanged: onChangedIncDecrButton,
            initialValue: initialValue ?? 0,
            quantitySize: fontsize,
            height: height ?? 25,
            width: width ?? 100);
      case ButtonType.buttonWithTextAndIcon:
        return CardContainer(
            onTap: onPressed,
            withBottomMargin: false,
            height: height ?? 35,
            alignment: Alignment.center,
            width: width ?? 80,
            child: widgetChild ??
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(iconAnimated,
                          color: buttonColor ?? context.theme.primaryColor,
                          size: iconsize),
                      const SizedBox(width: 5),
                      Text(text ?? "",
                          style: const TextStyle(fontWeight: FontWeight.w500))
                    ]));
      case ButtonType.basic:
      default:
        return ElevatedButton(
            style: _buttonStyle(buttonType, context, bgcolor: buttonColor),
            onPressed: onPressed,
            child: Text(text ?? "Submit",
                style: TextStyle(
                    fontWeight: fontWeight,
                    color: textColor,
                    fontSize: fontsize ?? 15)));
    }
  }

  ButtonStyle _buttonStyle(ButtonType? buttonType, BuildContext context,
      {Color? bgcolor, Color? fgcolor, BorderSide? side}) {
    switch (buttonType) {
      case ButtonType.textbutton:
        return ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                side: side ?? BorderSide.none,
                borderRadius: BorderRadius.circular(8)),
            padding: padding);
      case ButtonType.basic:
      default:
        return ElevatedButton.styleFrom(
            foregroundColor: fgcolor,
            backgroundColor: bgcolor ?? Theme.of(context).primaryColor,
            fixedSize: (width != 0 && height != 0)
                ? Size(width ?? 100, height ?? 30)
                : null,
            shape: RoundedRectangleBorder(
                side: side ?? BorderSide.none,
                borderRadius: BorderRadius.circular(radius ?? 8)),
            padding: padding);
    }
  }
}

class AnimatedButton extends StatefulWidget {
  final void Function()? onPressed;
  final double? sizeWhileLoading;
  final Widget? child;
  final IconData? icon;
  final int delayedInSeconds;
  final bool withAnimation;
  const AnimatedButton(
      {super.key,
      required this.onPressed,
      this.sizeWhileLoading = 50,
      this.child,
      this.icon,
      this.delayedInSeconds = 2,
      this.withAnimation = true});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isDelayFinished = true;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: widget.delayedInSeconds - 1));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _startDelayedProcess() async {
    _isDelayFinished = false;
    setState(() {
      _controller.reset();
      _controller.forward();
    });
    try {
      await Future.delayed(Duration(seconds: widget.delayedInSeconds), () {
        _isDelayFinished = true;
        if (_controller.status.name != 'completed') {
          _controller.stop();
        }
        setState(() {});
      });
    } catch (e) {
      if (kDebugMode) {
        print("Closed");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.withAnimation
        ? RotationTransition(
            filterQuality: FilterQuality.high,
            turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
            child: GestureDetector(
                onTap: () {
                  if (_isDelayFinished) {
                    _startDelayedProcess();
                    widget.onPressed?.call();
                  }
                },
                child: !_isDelayFinished
                    ? SizedBox(
                        height: widget.sizeWhileLoading,
                        width: widget.sizeWhileLoading,
                        child: progressIndicatorWidget(context: context).center)
                    : widget.child ??
                        Icon(widget.icon ?? Icons.refresh,
                            color: context.theme.primaryColor)))
        : GestureDetector(
            onTap: () {
              if (_isDelayFinished) {
                _startDelayedProcess();
                widget.onPressed?.call();
              }
            },
            child: widget.child ??
                Icon(widget.icon ?? Icons.refresh,
                    color: context.theme.primaryColor));
  }
}

class _QuantityIncAndDecButton extends StatefulWidget {
  final double width;
  final double height;
  final int initialValue;
  final double? quantitySize;
  final void Function(int)? onChanged;

  const _QuantityIncAndDecButton(
      {super.key,
      this.width = 100,
      this.height = 25,
      this.initialValue = 0,
      this.onChanged,
      this.quantitySize});

  @override
  State<_QuantityIncAndDecButton> createState() =>
      __QuantityIncAndDecButtonState();
}

class __QuantityIncAndDecButtonState extends State<_QuantityIncAndDecButton> {
  late int value;

  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }

  @override
  void didUpdateWidget(_QuantityIncAndDecButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      setState(() {
        value = widget.initialValue;
      });
    }
  }

  void _onIncrement() {
    setState(() {
      value += 1;
    });
    widget.onChanged?.call(value);
  }

  void _onDecrement() {
    if (value > 0) {
      setState(() {
        value -= 1;
      });
      widget.onChanged?.call(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CardContainer(
        height: widget.height,
        width: widget.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CardContainer(
                onTap: () => _onDecrement(),
                withBottomMargin: false,
                child: const Icon(Icons.remove)),
            Text(value.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: widget.quantitySize)),
            CardContainer(
                onTap: () => _onIncrement(),
                withBottomMargin: false,
                child: const Icon(Icons.add))
          ],
        ));
  }
}
