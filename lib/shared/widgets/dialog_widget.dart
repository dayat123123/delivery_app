import 'package:delivery_app/shared/extensions/theme_extensions/theme.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

enum DialogAccentType { success, failed, warning, info }

class DialogWidget {
  DialogWidget._();

  static SnackBar scaffoldMessenger(String message, BuildContext context,
          {DialogAccentType? type}) =>
      SnackBar(
          elevation: 0,
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          backgroundColor: dialogAccentcolor(type),
          content: Text(message, style: const TextStyle(fontSize: 16)).center);

  static Color? dialogAccentcolor(DialogAccentType? type) {
    if (type == null) return Colors.black12;
    Color color;
    switch (type) {
      case DialogAccentType.success:
        color = AppColors.success;
        break;
      case DialogAccentType.warning:
        color = AppColors.warning;
        break;
      case DialogAccentType.failed:
        color = AppColors.error;
        break;
      case DialogAccentType.info:
        color = AppColors.info;
        break;
    }
    return color;
  }
}
