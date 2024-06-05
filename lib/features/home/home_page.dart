import 'package:delivery_app/features/home/sub_menu/page1.dart';
import 'package:delivery_app/features/home/widgets/appbar.dart';
import 'package:delivery_app/features/home/widgets/bottomnavigatorbar.dart';
import 'package:delivery_app/features/home/widgets/drawer.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  final List<Widget> _pages = [const Page1(), Container(color: Colors.red)];
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        padding: EdgeInsets.zero,
        drawer: const CustomDrawer(),
        appbar: customAppBar(context),
        body: IndexedStack(index: _selectedIndex, children: _pages),
        bottomNavigationBar: CustomBottomNavigatorBar(
            currentIndex: _selectedIndex, onTap: (p0) => _onItemTapped(p0)));
  }
}
