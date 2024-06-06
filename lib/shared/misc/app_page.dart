import 'package:delivery_app/features/authentication/presentation/register_page.dart';
import 'package:delivery_app/features/detail_category/presentation/detail_category.dart';
import 'package:delivery_app/features/detail_product/presentation/detail_product.dart';
import 'package:delivery_app/features/home/main_page.dart';
import 'package:delivery_app/features/order/presentation/order_page.dart';
import 'package:delivery_app/features/wishlist/wishlist_page.dart';
import 'package:delivery_app/features/search/presentation/search_page.dart';
import 'package:delivery_app/shared/misc/params_key.dart';
import 'package:delivery_app/shared/misc/route_names.dart';
import 'package:delivery_app/features/home/home_page.dart';
import 'package:delivery_app/features/landing/landing_page.dart';
import 'package:delivery_app/features/authentication/presentation/login_page.dart';
import 'package:delivery_app/features/landing/splash_page.dart';
import 'package:flutter/material.dart';

class AppPage {
  AppPage._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.root:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case RouteNames.landingpage:
        return MaterialPageRoute(builder: (context) => const LandingPage());
      case RouteNames.loginpage:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case RouteNames.registerpage:
        return MaterialPageRoute(builder: (context) => const RegisterPage());
      case RouteNames.homepage:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case RouteNames.mainpage:
        return MaterialPageRoute(builder: (context) => const MainPage());
      case RouteNames.detailitempage:
        final data = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) =>
                DetailProductPage(idProduct: data[ParamsKey.idProduct]));
      case RouteNames.searchpage:
        return MaterialPageRoute(builder: (context) => const SearchPage());
      case RouteNames.orderpage:
        return MaterialPageRoute(builder: (context) => const OrderPage());
      case RouteNames.wishlistpage:
        return MaterialPageRoute(builder: (context) => const WishlistPage());
      case RouteNames.detailcategory:
        final data = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) =>
                DetailCategory(category: data[ParamsKey.title]));
      default:
        return MaterialPageRoute(builder: (context) => const SizedBox.shrink());
    }
  }
}
