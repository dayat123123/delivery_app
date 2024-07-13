import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/misc/app_pages.dart';
import 'package:delivery_app/shared/misc/file_paths.dart';
import 'package:delivery_app/shared/widgets/button.dart';
import 'package:delivery_app/shared/widgets/carousel.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        padding: const EdgeInsets.only(),
        body: SizedBox(
            height: context.fullHeight,
            width: context.fullWidth,
            child: CustomCarousel(
                listwidget: listwidgetLanding,
                widgetPositioned: [
                  Positioned(
                      bottom: 40,
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        CustomButton(
                            height: 50,
                            fontsize: 16,
                            fontWeight: FontWeight.bold,
                            width: context.fullWidth * 0.35,
                            onPressed: () =>
                                context.pushNamed(RouteNames.registerpage),
                            text: 'Sign Up'),
                        const SizedBox(width: 10),
                        CustomButton(
                            fontsize: 16,
                            height: 50,
                            fontWeight: FontWeight.bold,
                            width: context.fullWidth * 0.35,
                            onPressed: () =>
                                context.pushNamed(RouteNames.loginpage),
                            text: 'Sign In')
                      ]))
                ])));
  }
}

final List<Widget> listwidgetLanding = [
  Container(
    child: Center(
      child: SvgPicture.asset(FilePaths.signInimagessvg),
    ),
  ),
  Container(
    child: Center(
      child: SvgPicture.asset(FilePaths.signUpimagessvg),
    ),
  ),
];
