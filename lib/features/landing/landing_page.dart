import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/widgets/carousel.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        padding: const EdgeInsets.only(),
        body: SizedBox(
            height: context.fullHeight,
            width: context.fullWidth,
            child: const CustomCarousel()));
  }
}
