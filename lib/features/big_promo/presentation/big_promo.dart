import 'package:delivery_app/shared/widgets/carousel.dart';
import 'package:flutter/material.dart';

class BigPromo extends StatelessWidget {
  final TabController tabController;
  final List<Widget> list;
  const BigPromo({super.key, required this.tabController, required this.list});

  @override
  Widget build(BuildContext context) {
    return CustomCarousel(
        animateView: true,
        tabController: tabController,
        listwidget: list,
        positionedIndicatorBottom: 15);
  }
}
