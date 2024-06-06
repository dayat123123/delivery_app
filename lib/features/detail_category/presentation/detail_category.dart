import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class DetailCategory extends StatelessWidget {
  final String category;
  const DetailCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appbar: AppBar(title: Text(category)),
      body: Column(),
    );
  }
}
