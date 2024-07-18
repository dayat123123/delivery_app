import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appbar: AppBar(
      title: const Text('Order'),
    ));
  }
}
