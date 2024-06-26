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
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: BottomNavigationBar(
            items: _listitem, currentIndex: currentIndex, onTap: onTap));
  }
}

List<BottomNavigationBarItem> _listitem = [
  const BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home_max)),
  const BottomNavigationBarItem(
      label: 'Order',
      activeIcon: Icon(Icons.shopping_cart_rounded),
      icon: Icon(Icons.shopping_cart_rounded)),
  const BottomNavigationBarItem(
      activeIcon: Icon(Icons.favorite_border),
      label: 'Wishlist',
      icon: Icon(Icons.favorite_border))
];
