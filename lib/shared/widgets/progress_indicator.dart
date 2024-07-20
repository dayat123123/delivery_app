import 'dart:io';

import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget progressIndicatorWidget(
    {double? value, double strokeWidth = 4.0, required BuildContext context}) {
  return Platform.isIOS
      ? CupertinoActivityIndicator(color: context.theme.iconTheme.color)
      : CircularProgressIndicator(value: value, strokeWidth: strokeWidth);
}
