import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final AppBar? appbar;
  final Widget? body;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final bool? drawerEnableOpenDragGesture;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Color? backgroundColor;
  const CustomScaffold(
      {super.key,
      this.appbar,
      this.margin,
      this.padding = StyleHelpers.horizontalPadding,
      this.body,
      this.drawer,
      this.bottomNavigationBar,
      this.drawerEnableOpenDragGesture,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.extendBody = false,
      this.extendBodyBehindAppBar = false,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: extendBody,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        floatingActionButtonLocation: floatingActionButtonLocation,
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture ?? true,
        bottomNavigationBar: bottomNavigationBar,
        drawer: drawer,
        resizeToAvoidBottomInset: false,
        appBar: appbar,
        backgroundColor: backgroundColor,
        floatingActionButton: floatingActionButton,
        body: Container(
            margin: margin,
            padding: padding,
            child: body ?? const Placeholder()));
  }
}
