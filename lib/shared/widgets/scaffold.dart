import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final AppBar? appbar;
  final Widget? body;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final bool? drawerEnableOpenDragGesture;
  const CustomScaffold(
      {super.key,
      this.appbar,
      this.margin,
      this.padding = const EdgeInsets.symmetric(horizontal: 15),
      this.body,
      this.drawer,
      this.bottomNavigationBar,
      this.drawerEnableOpenDragGesture});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: drawerEnableOpenDragGesture ?? true,
      bottomNavigationBar: bottomNavigationBar,
      drawer: drawer,
      resizeToAvoidBottomInset: false,
      appBar: appbar,
      body: Container(
        margin: margin,
        padding: padding,
        child: body ?? const Placeholder(),
      ),
    );
  }
}
