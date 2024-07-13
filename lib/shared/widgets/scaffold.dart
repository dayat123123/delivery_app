import 'package:delivery_app/shared/misc/spacer.dart';
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
  const CustomScaffold(
      {super.key,
      this.appbar,
      this.margin,
      this.padding = SpacerHelper.horizontalPadding,
      this.body,
      this.drawer,
      this.bottomNavigationBar,
      this.drawerEnableOpenDragGesture,
      this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture ?? true,
        bottomNavigationBar: bottomNavigationBar,
        drawer: drawer,
        resizeToAvoidBottomInset: false,
        appBar: appbar,
        floatingActionButton: floatingActionButton,
        body: Container(
            margin: margin,
            padding: padding,
            child: body ?? const Placeholder()));
  }
}
