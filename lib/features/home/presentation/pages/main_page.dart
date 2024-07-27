import 'package:delivery_app/features/cart_order/presentation/bloc/cart_order_bloc.dart';
import 'package:delivery_app/features/home/presentation/pages/home_page.dart';
import 'package:delivery_app/features/home/presentation/widgets/bottomnavigatorbar.dart';
import 'package:delivery_app/features/order/presentation/pages/order_page.dart';
import 'package:delivery_app/features/wishlish/presentation/pages/wishlist_page.dart';
import 'package:delivery_app/injector.dart';
import 'package:delivery_app/features/wishlish/presentation/bloc/favorite_bloc.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const OrderPage(),
    const WishlistPage()
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      switch (index) {
        case 0:
          break;
        case 1:
          inject.get<CartOrderBloc>().add(LoadCartOrder());
          break;
        case 2:
          inject.get<FavoriteBloc>().add(const LoadAllFavorites());
          break;
      }
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
