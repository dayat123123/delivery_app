import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/card_container.dart';
import 'package:flutter/material.dart';

class AllProductStore extends StatelessWidget {
  const AllProductStore({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.75,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) {
          return CardContainer(
              borderRadius: 5, height: 100, child: Text("DATA KE $index"));
        }).marginSymmetric(horizontal: 5, vertical: 10);
  }
}
