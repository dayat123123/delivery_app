import 'dart:async';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:flutter/material.dart';

class CustomCarousel extends StatefulWidget {
  final List<Widget> listwidget;
  final TabController? tabController;
  final double positionedIndicatorBottom;
  final List<Widget>? widgetPositioned;
  final bool animateView;
  final bool isShowIndicator;
  final int durationAnimateinseconds;
  final bool withPadding;
  final int? initialIndex;
  const CustomCarousel(
      {super.key,
      required this.listwidget,
      this.tabController,
      this.positionedIndicatorBottom = 130,
      this.widgetPositioned,
      this.animateView = false,
      this.isShowIndicator = true,
      this.durationAnimateinseconds = 8,
      this.withPadding = true,
      this.initialIndex});

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel>
    with SingleTickerProviderStateMixin {
  late final TabController? _tabController;
  late final int _itemCount;
  late final List<Widget> _listCarouselwidget;
  late Timer _timer;
  late int _currentIndex;
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex ?? 0;
    _itemCount = widget.listwidget.length;
    _listCarouselwidget = widget.listwidget;
    _tabController = widget.tabController ??
        TabController(
            length: _itemCount, vsync: this, initialIndex: _currentIndex);
    animateView();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    closeAnimateView();
    super.dispose();
  }

  void closeAnimateView() {
    if (widget.animateView) {
      _timer.cancel();
    }
  }

  void animateView() {
    _tabController?.addListener(() {
      _currentIndex = _tabController.index;
      setState(() {});
    });
    if (widget.animateView) {
      _timer = Timer.periodic(
          Duration(seconds: widget.durationAnimateinseconds), (timer) {
        if (_currentIndex < widget.listwidget.length - 1) {
          _currentIndex += 1;
        } else {
          _currentIndex = 0;
        }
        _tabController?.animateTo(_currentIndex,
            curve: Curves.decelerate,
            duration: const Duration(milliseconds: 500));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      TabBarView(
        clipBehavior: Clip.antiAlias,
        controller: _tabController,
        children: List.generate(
            growable: false,
            _listCarouselwidget.length,
            (index) => widget.withPadding
                ? _listCarouselwidget[index].paddingSymmetric(
                    horizontal: StyleHelpers.horizontalPaddingnumber)
                : _listCarouselwidget[index]),
      ),
      if (widget.isShowIndicator)
        Positioned(
            bottom: widget.positionedIndicatorBottom,
            child: PageIndicator(
                inactiveColor: context.themeColors.micIcon.withOpacity(0.6),
                activeColor: context.theme.primaryColor,
                currentIndex: _currentIndex,
                itemCount: _itemCount)),
      ...widget.widgetPositioned ?? []
    ]);
  }
}

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;
  final double dotSize;
  final double dotSpacing;
  final Color activeColor;
  final Color inactiveColor;

  const PageIndicator(
      {super.key,
      required this.currentIndex,
      required this.itemCount,
      this.dotSize = 8,
      this.dotSpacing = 8.0,
      required this.activeColor,
      required this.inactiveColor});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(itemCount, (index) => _indicatorWidget(index)));
  }

  Widget _indicatorWidget(int index) {
    bool isCurrentIndex = index == currentIndex;
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(horizontal: dotSpacing / 2),
        width: isCurrentIndex ? dotSize + 15 : dotSize,
        height: dotSize,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            color: isCurrentIndex ? activeColor : inactiveColor));
  }
}
