import 'package:delivery_app/shared/constans/pathfile.dart';
import 'package:delivery_app/shared/constans/route_names.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List<Widget> listCarouselwidget = [
  Container(
    child: Center(
      child: SvgPicture.asset(PathFile.signInimagessvg),
    ),
  ),
  Container(
    child: Center(
      child: SvgPicture.asset(PathFile.signUpimagessvg),
    ),
  ),
];

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({super.key});

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  int _currentIndex = 0;
  final int _itemCount = listCarouselwidget.length;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: _itemCount, vsync: this, initialIndex: _currentIndex);
    _tabController.addListener(
      () {
        _currentIndex = _tabController.index;
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        TabBarView(
            controller: _tabController,
            children: List.generate(listCarouselwidget.length,
                (index) => listCarouselwidget[index])),
        Positioned(
            bottom: 130,
            child: PageIndicator(
                onTap: (p0) {
                  if (_currentIndex != p0) {
                    _currentIndex = p0;
                    _tabController.index = _currentIndex;
                    setState(() {});
                  }
                },
                inactiveColor: context.themeColors.unselectedLabel,
                activeColor: context.theme.primaryColor,
                currentIndex: _currentIndex,
                itemCount: _itemCount)),
        Positioned(
          bottom: 40,
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            CustomButton(
                height: 50,
                fontsize: 16,
                fontWeight: FontWeight.bold,
                width: context.fullWidth * 0.35,
                onPressed: () {
                  context.pushNamed(RouteNames.registerpage);
                },
                text: 'Sign Up'),
            const SizedBox(width: 10),
            CustomButton(
                fontsize: 16,
                height: 50,
                fontWeight: FontWeight.bold,
                width: context.fullWidth * 0.35,
                onPressed: () {
                  context.pushNamed(RouteNames.loginpage);
                },
                text: 'Sign In')
          ]),
        )
      ],
    );
  }
}

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;
  final double dotSize;
  final double dotSpacing;
  final Color activeColor;
  final Color inactiveColor;
  final void Function(int) onTap;

  const PageIndicator(
      {super.key,
      required this.currentIndex,
      required this.itemCount,
      this.dotSize = 12,
      this.dotSpacing = 8.0,
      required this.activeColor,
      required this.inactiveColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(itemCount, (index) {
      return InkWell(
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          onTap: () => onTap(index),
          child: _indicatorWidget(index));
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
              borderRadius: BorderRadius.circular(15),
              color: activeColor));
    } else {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(horizontal: dotSpacing / 2),
        width: dotSize,
        height: dotSize,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
            color: inactiveColor),
      );
    }
  }
}
