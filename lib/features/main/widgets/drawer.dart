import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        padding: EdgeInsets.only(top: 30, bottom: 50),
        child: Column(
          children: [Text('sdd'), Spacer(), Text('ss')],
        ),
      ),
    );
  }
}
