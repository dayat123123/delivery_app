import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appbar: AppBar(
        title: const Text("Notification"),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
