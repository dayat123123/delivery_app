import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appbar: AppBar(
        title: Text('WishList'),
      ),
    );
  }
}
