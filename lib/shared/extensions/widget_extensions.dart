import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget paddingAll(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Padding(
          padding:
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
          child: this);

  Widget paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
          padding: EdgeInsets.only(
              top: top, left: left, right: right, bottom: bottom),
          child: this);
  Widget marginAll(double padding) =>
      Container(margin: EdgeInsets.all(padding), child: this);

  Widget marginSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Container(
          margin:
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
          child: this);

  Widget marginOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Container(
          margin: EdgeInsets.only(
              top: top, left: left, right: right, bottom: bottom),
          child: this);

  Widget get paddingZero => Padding(padding: EdgeInsets.zero, child: this);
}

extension WidgetUtility on Widget {
  Widget backgroundColor(Color color) => Container(color: color, child: this);

  Widget get center => Center(child: this);

  Widget get centerRight =>
      Align(alignment: Alignment.centerRight, child: this);
  Widget get centerLeft => Align(alignment: Alignment.centerLeft, child: this);

  Widget maxWidth(BuildContext context) =>
      SizedBox(width: context.fullWidth, child: this);

  Widget height(double value) => SizedBox(height: value, child: this);
}
