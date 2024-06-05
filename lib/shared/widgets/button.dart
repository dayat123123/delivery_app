import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

enum ButtonType { basic, textbutton }

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final double? height;
  final double? width;
  final double? fontsize;
  final EdgeInsetsGeometry? padding;
  final ButtonType? buttonType;
  final Color? textColor;
  final Color? buttonColor;
  final double? radius;
  final FontWeight? fontWeight;
  const CustomButton(
      {super.key,
      required this.onPressed,
      this.text,
      this.height,
      this.width,
      this.padding,
      this.buttonType,
      this.textColor,
      this.buttonColor,
      this.fontsize,
      this.radius,
      this.fontWeight});

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
      case ButtonType.basic:
      default:
        return ElevatedButton(
            style: _buttonStyle(buttonType, context, bgcolor: buttonColor),
            onPressed: onPressed,
            child: Text(text ?? "Submit",
                style: TextStyle(
                    fontWeight: fontWeight,
                    color: textColor ?? Colors.white,
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
          padding: padding,
        );
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
          padding: padding,
        );
    }
  }
}
