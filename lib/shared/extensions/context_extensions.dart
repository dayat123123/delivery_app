import 'package:delivery_app/shared/extensions/theme_extensions/theme.dart';
import 'package:delivery_app/shared/widgets/dialog_widget.dart';
import 'package:delivery_app/shared/widgets/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
export 'package:delivery_app/shared/widgets/dialog_widget.dart';

extension ContextExt on BuildContext {
  void showSnackbar(String message, {DialogAccentType? type}) {
    ScaffoldMessenger.of(this)
      ..removeCurrentSnackBar()
      ..showSnackBar(
          snackBarAnimationStyle: AnimationStyle(
              duration: const Duration(milliseconds: 250),
              reverseDuration: const Duration(milliseconds: 500)),
          DialogWidget.scaffoldMessenger(message, this, type: type));
  }

  void showCustomSnackbar(
      {DialogAccentType? type,
      String? title,
      required String description,
      Duration? duration,
      IconData? icon,
      bool useIcon = true}) {
    DialogWidget.appSnackbar(
            type: type ?? DialogAccentType.info,
            title: title,
            description: description,
            duration: duration,
            icon: icon,
            useIcon: useIcon)
        .show(this);
  }

  void showBottomSheet({required List<Widget> child}) {
    showModalBottomSheet(
        context: this,
        showDragHandle: true,
        elevation: 0,
        isScrollControlled: false,
        backgroundColor: themeColors.appContainerBackground,
        builder: (BuildContext context) =>
            CustomModalBottomSheet(widget: child));
  }

  void push(Widget destination, {Object? arguments}) {
    Navigator.push(
      this,
      MaterialPageRoute(
          builder: (context) => destination,
          settings: RouteSettings(arguments: arguments)),
    );
  }

  void pushReplacement(Widget destination, {Object? arguments}) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(
          builder: (context) => destination,
          settings: RouteSettings(arguments: arguments)),
    );
  }

  void pushAndRemoveUntil(Widget destination, {Object? arguments}) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(
          builder: (context) => destination,
          settings: RouteSettings(arguments: arguments)),
      (route) => false,
    );
  }

  void pushNamed(String routeName, {Object? arguments}) {
    Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  void pushReplacementNamed(String routeName, {Object? arguments}) {
    Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

  void pushNamedAndRemoveUntil(String routeName, {Object? arguments}) {
    Navigator.pushNamedAndRemoveUntil(this, routeName, (r) => false,
        arguments: arguments);
  }

  void pop({dynamic result}) {
    Navigator.pop(this, result);
  }

  ThemeData get theme => Theme.of(this);
  ThemeColors get themeColors => theme.extension<ThemeColors>()!;
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// The same of [MediaQuery.of(context).size]
  Size get mediaQuerySize => MediaQuery.of(this).size;

  /// The same of [MediaQuery.of(context).size.height]
  /// Note: updates when you rezise your screen (like on a browser or
  /// desktop window)
  double get fullHeight => mediaQuerySize.height;

  /// The same of [MediaQuery.of(context).size.width]
  /// Note: updates when you rezise your screen (like on a browser or
  /// desktop window)
  double get fullWidth => mediaQuerySize.width;

  /// get the shortestSide from screen
  double get mediaQueryShortestSide => mediaQuerySize.shortestSide;

  /// True if the shortestSide is largest than 600p
  bool get isSmallTablet => (mediaQueryShortestSide >= 600);

  /// True if the shortestSide is largest than 720p
  bool get isLargeTablet => (mediaQueryShortestSide >= 720);

  /// True if the current device is Tablet
  bool get isTablet => isSmallTablet || isLargeTablet;

  /// True if the width is smaller than 1200p
  bool get isDesktopOrLess => fullWidth <= 1200;

  /// True if the width is higher than 1200p
  bool get isDesktopOrWider => fullWidth >= 1200;

  /// same as [isDesktopOrLess]
  bool get isDesktop => isDesktopOrLess;
}
