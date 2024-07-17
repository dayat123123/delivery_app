import 'package:flutter/material.dart';

class StyleHelpers {
  StyleHelpers._();
  static const double leftrightPadding = 10;
  static const double rightMargin = 13;
  static const double borderRadius = 10;
  static const BorderRadiusGeometry borderRadiusGeometry =
      BorderRadius.all(Radius.circular(10));
  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 15);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 15);
  static const EdgeInsets allPadding = EdgeInsets.all(15);
  static const double horizontalPaddingnumber = 15;
  static const BorderRadiusGeometry topRadius = BorderRadius.only(
      topLeft: Radius.circular(25), topRight: Radius.circular(30));
}
