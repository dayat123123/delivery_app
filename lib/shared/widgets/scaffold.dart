import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final AppBar? appbar;
  final Widget? body;
  final EdgeInsetsGeometry padding;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  const CustomScaffold(
      {super.key,
      this.appbar,
      this.padding = const EdgeInsets.symmetric(horizontal: 15),
      this.body,
      this.drawer,
      this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      drawer: drawer,
      resizeToAvoidBottomInset: false,
      appBar: appbar,
      body: Container(padding: padding, child: body ?? const Placeholder()),
    );
  }
}
