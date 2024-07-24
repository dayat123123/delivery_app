import 'dart:io';

import 'package:flutter/material.dart';

class StyleHelpers {
  StyleHelpers._();
  static const double leftrightPadding = 10;
  static const double rightMargin = 13;
  static const double borderRadius = 10;
  static const BorderRadiusGeometry borderRadiusGeometry =
      BorderRadius.all(Radius.circular(borderRadius));
  static EdgeInsets topMarginScaffold =
      EdgeInsets.only(top: Platform.isAndroid ? 5 : 15);
  static EdgeInsets verticalPadding =
      EdgeInsets.symmetric(vertical: Platform.isAndroid ? 5 : 15);
  static EdgeInsets bottomPaddingInside = const EdgeInsets.only(bottom: 5);
  static const double allPaddingNumber = 15;
  static const EdgeInsets allPadding = EdgeInsets.all(allPaddingNumber);
  static const double horizontalPaddingnumber = 15;
  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: horizontalPaddingnumber);
  static const BorderRadiusGeometry topRadius = BorderRadius.only(
      topLeft: Radius.circular(25), topRight: Radius.circular(30));
}
