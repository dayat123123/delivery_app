import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class DetailItemPage extends StatefulWidget {
  const DetailItemPage({super.key});

  @override
  State<DetailItemPage> createState() => _DetailItemPageState();
}

class _DetailItemPageState extends State<DetailItemPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appbar: AppBar(
        title: Text('Detail Item'),
        actions: [Icon(Icons.favorite).marginOnly(right: 15)],
      ),
      body: Column(),
    );
  }
}
