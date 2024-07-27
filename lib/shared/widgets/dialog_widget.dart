import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/theme_extensions/theme.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:delivery_app/shared/widgets/button.dart';
import 'package:flutter/material.dart';

enum DialogAccentType { success, failed, warning, info }

enum DialogType { confirmation, notification }

class DialogWidget {
  DialogWidget._();

  static SnackBar scaffoldMessenger(String message, BuildContext context,
          {DialogAccentType? type}) =>
      SnackBar(
          elevation: 0,
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          backgroundColor: dialogAccentcolor(type),
          content: Text(message, style: const TextStyle(fontSize: 16)).center);

  static Color dialogAccentcolor(DialogAccentType? type) {
    if (type == null) return Colors.black12;
    Color color;
    switch (type) {
      case DialogAccentType.success:
        color = AppColors.success;
        break;
      case DialogAccentType.failed:
        color = AppColors.error;
        break;
      case DialogAccentType.warning:
        color = AppColors.warning;
        break;
      case DialogAccentType.info:
        color = AppColors.info;
        break;
    }
    return color;
  }

  static IconData dialogIcon(DialogAccentType? type) {
    IconData iconDef = Icons.notifications_active;
    if (null == type) return iconDef;
    switch (type) {
      case DialogAccentType.success:
        iconDef = Icons.check;
        break;
      case DialogAccentType.failed:
        iconDef = Icons.close;
        break;
      case DialogAccentType.warning:
        iconDef = Icons.warning_amber_rounded;
        break;
      case DialogAccentType.info:
        iconDef = Icons.notifications_active;
        break;
    }
    return iconDef;
  }

  static AlertDialog alertDialog(BuildContext context,
      {String? title,
      String? content,
      Widget? customContent,
      void Function()? onPressed,
      void Function()? customOnpressed,
      String? aproveNameButton}) {
    final TextTheme textTheme = context.theme.textTheme;
    final ThemeColors themeColors = context.themeColors;
    return AlertDialog(
        backgroundColor: themeColors.settingsDialogLanguage,
        contentTextStyle: TextStyle(
            color: textTheme.bodyMedium?.color?.withOpacity(0.8), fontSize: 17),
        titleTextStyle:
            TextStyle(color: textTheme.headlineLarge?.color, fontSize: 18),
        title: Text(title ?? "Confirm"),
        content: customContent ?? Text(content ?? ""),
        actionsAlignment: MainAxisAlignment.end,
        shape: const RoundedRectangleBorder(
            borderRadius: StyleHelpers.borderRadiusGeometry),
        actionsPadding: StyleHelpers.horizontalPadding.copyWith(bottom: 10),
        actions: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomButton(
                    text: aproveNameButton ?? "Approve",
                    padding: EdgeInsets.zero,
                    onPressed: customOnpressed ??
                        () {
                          context.pop();
                          onPressed?.call();
                        },
                    buttonType: ButtonType.textbutton),
                CustomButton(
                    text: "Cancel",
                    onPressed: () => context.pop(),
                    buttonType: ButtonType.textbutton)
              ])
        ]);
  }

  static AnimatedSnackBar appSnackbar(
      {required DialogAccentType type,
      IconData? icon,
      String? title,
      String? description,
      Duration? duration,
      bool useIcon = true}) {
    Color color = dialogAccentcolor(type);
    IconData iconDef = dialogIcon(type);

    return AnimatedSnackBar(
        builder: (context) {
          return GestureDetector(
              onTap: () => AnimatedSnackBar.removeAll(),
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                  decoration: BoxDecoration(
                      color: color,
                      gradient: RadialGradient(colors: [
                        color.withOpacity(0.9),
                        color.withOpacity(0.8)
                      ], stops: const [
                        0,
                        1
                      ], radius: 1, center: Alignment.bottomCenter),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(blurRadius: 5, color: color.withOpacity(0.2))
                      ]),
                  width: double.infinity,
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    if (useIcon)
                      Flexible(
                          flex: 2,
                          child: CircleAvatar(
                              backgroundColor: Colors.white.withOpacity(0.03),
                              radius: 26,
                              child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor:
                                      Colors.white.withOpacity(0.05),
                                  child: Icon(icon ?? iconDef,
                                      color: Colors.white.withOpacity(0.9))))),
                    if (useIcon) const SizedBox(width: 5),
                    Expanded(
                        flex: 7,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(title ?? type.name.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white.withOpacity(0.95))),
                              Text(description ?? "",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white.withOpacity(0.95)),
                                  maxLines: 3,
                                  softWrap: true)
                            ]))
                  ])));
        },
        duration: duration ?? const Duration(seconds: 2),
        snackBarStrategy: RemoveSnackBarStrategy());
  }
}
