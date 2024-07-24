import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:delivery_app/shared/widgets/shimmer.dart';
import 'package:flutter/material.dart';

class AboutToko extends StatelessWidget {
  final bool isLoading;
  const AboutToko({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
          margin: StyleHelpers.topMarginScaffold,
          padding: StyleHelpers.horizontalPadding,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomShimmer(width: 100, height: 28),
                const SizedBox(height: 10),
                CustomShimmer(width: context.fullWidth, height: 150),
              ]));
    }
    return Container(
        margin: StyleHelpers.topMarginScaffold,
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
