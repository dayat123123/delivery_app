import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:delivery_app/shared/widgets/scrollbar.dart';
import 'package:flutter/material.dart';

class CommentsShowmore extends StatelessWidget {
  final String sellerId;
  final String productId;
  const CommentsShowmore(
      {super.key, required this.sellerId, required this.productId});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appbar: AppBar(title: Text("Comments")),
      body: CustomScrollBar(
        child: Text(""),
      ),
    );
  }
}
