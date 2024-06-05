import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigatorBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int)? onTap;
  const CustomBottomNavigatorBar(
      {super.key, required this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(
          splashColor: Colors.transparent, highlightColor: Colors.transparent),
      child: BottomNavigationBar(
        items: _listitem,
        currentIndex: currentIndex,
        onTap: onTap,
      ),
    );
  }
}

List<BottomNavigationBarItem> _listitem = [
  BottomNavigationBarItem(
    label: "Home",
    icon: Icon(Icons.home_max),
  ),
  BottomNavigationBarItem(
    label: 'Search',
    icon: Icon(Icons.search),
  )
];
