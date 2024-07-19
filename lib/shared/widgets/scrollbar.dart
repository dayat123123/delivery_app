import 'package:flutter/material.dart';

class CustomScrollBar extends StatefulWidget {
  final Widget child;
  final ScrollPhysics physics;
  const CustomScrollBar(
      {super.key,
      required this.child,
      this.physics = const BouncingScrollPhysics()});

  @override
  State<CustomScrollBar> createState() => _CustomScrollBarState();
}

class _CustomScrollBarState extends State<CustomScrollBar> {
  late ScrollController _scrollbarController;

  @override
  void initState() {
    _scrollbarController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollbarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        controller: _scrollbarController,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: widget.physics,
            controller: _scrollbarController,
            child: widget.child));
  }
}
