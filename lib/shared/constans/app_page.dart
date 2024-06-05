import 'package:delivery_app/features/authentication/presentation/register_page.dart';
import 'package:delivery_app/shared/constans/route_names.dart';
import 'package:delivery_app/features/home/home_page.dart';
import 'package:delivery_app/features/landing/landing_page.dart';
import 'package:delivery_app/features/authentication/presentation/login_page.dart';
import 'package:delivery_app/features/landing/splash_page.dart';
import 'package:flutter/material.dart';

class AppPage {
  AppPage._();

  static Map<String, WidgetBuilder> routes = {
    RouteNames.root: (_) => const SplashPage(),
    RouteNames.landingpage: (_) => const LandingPage(),
    RouteNames.loginpage: (_) => const LoginPage(),
    RouteNames.registerpage: (_) => const RegisterPage(),
    RouteNames.homepage: (_) => const HomePage(),
  };
}
