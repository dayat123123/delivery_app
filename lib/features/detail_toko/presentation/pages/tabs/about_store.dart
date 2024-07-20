import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:flutter/material.dart';

class AboutStore extends StatelessWidget {
  const AboutStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: StyleHelpers.verticalPadding,
        padding: StyleHelpers.horizontalPadding,
        child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Best Seller',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
            ]));
  }
}
