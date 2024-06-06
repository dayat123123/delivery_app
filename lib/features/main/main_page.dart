import 'package:delivery_app/features/home/home_page.dart';
import 'package:delivery_app/features/main/widgets/bottomnavigatorbar.dart';
import 'package:delivery_app/features/order/presentation/order_page.dart';
import 'package:delivery_app/features/wishlist/wishlist_page.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        padding: EdgeInsets.zero,
        body: IndexedStack(index: _selectedIndex, children: _pages),
        bottomNavigationBar: CustomBottomNavigatorBar(
            currentIndex: _selectedIndex, onTap: (p0) => _onItemTapped(p0)));
  }
}

final List<Widget> _pages = [
  const HomePage(),
  const OrderPage(),
  const WishlistPage()
];
