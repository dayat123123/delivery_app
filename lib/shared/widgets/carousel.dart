import 'dart:async';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/spacer.dart';
import 'package:flutter/material.dart';

class CustomCarousel extends StatefulWidget {
  final List<Widget> listwidget;
  final TabController? tabController;
  final double positionedIndicatorBottom;
  final List<Widget>? widgetPositioned;
  final bool animateView;
  final int durationAnimateinseconds;
  const CustomCarousel(
      {super.key,
      required this.listwidget,
      this.tabController,
      this.positionedIndicatorBottom = 130,
      this.widgetPositioned,
      this.animateView = false,
      this.durationAnimateinseconds = 10});

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel>
    with SingleTickerProviderStateMixin {
  late final TabController? _tabController;
  late final int _itemCount;
  late final List<Widget> _listCarouselwidget;
  late Timer _timer;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
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
          (index) => _listCarouselwidget[index].paddingSymmetric(
              horizontal: SpacerHelper.horizontalPaddingnumber),
        ),
      ),
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
        children: List.generate(itemCount, (index) {
      return _indicatorWidget(index);
    }));
  }

  Widget _indicatorWidget(int index) {
    if (index == currentIndex) {
      return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: dotSpacing / 2),
          width: dotSize + 15,
          height: dotSize,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              color: activeColor));
    } else {
      return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: dotSpacing / 2),
          width: dotSize,
          height: dotSize,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              color: inactiveColor));
    }
  }
}
