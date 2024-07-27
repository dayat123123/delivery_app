import 'package:delivery_app/features/authentication/presentation/pages/register_page.dart';
import 'package:delivery_app/features/cart_order/presentation/pages/cart_order.dart';
import 'package:delivery_app/features/checkout_order/presentation/pages/checkout_order.dart';
import 'package:delivery_app/features/detail_category/presentation/pages/detail_category.dart';
import 'package:delivery_app/features/detail_product/presentation/pages/comments_showmore.dart';
import 'package:delivery_app/features/detail_product/presentation/pages/detail_product.dart';
import 'package:delivery_app/features/detail_product/presentation/pages/focus_comment.dart';
import 'package:delivery_app/features/detail_toko/presentation/pages/detail_store.dart';
import 'package:delivery_app/features/home/presentation/pages/main_page.dart';
import 'package:delivery_app/features/notification/presentation/notification.dart';
import 'package:delivery_app/features/order/presentation/pages/order_page.dart';
import 'package:delivery_app/features/favorit/presentation/pages/detail_wishlist.dart';
import 'package:delivery_app/features/favorit/presentation/pages/wishlist_page.dart';
import 'package:delivery_app/features/search/presentation/pages/search_page.dart';
import 'package:delivery_app/shared/misc/params_keys.dart';
import 'package:delivery_app/features/home/presentation/pages/home_page.dart';
import 'package:delivery_app/features/landing/presentation/pages/landing_page.dart';
import 'package:delivery_app/features/authentication/presentation/pages/login_page.dart';
import 'package:delivery_app/features/landing/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';

class AppPages {
  AppPages._();

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
                DetailProductPage(data: data[ParamsKeys.cartProduct]));
      case RouteNames.focustcommentpage:
        final data = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => FocusComment(
                indexImage: data[ParamsKeys.indexImageKey],
                data: data[ParamsKeys.commentDataKey]));
      case RouteNames.showmorecomments:
        final data = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => CommentsShowmore(
                productId: data[ParamsKeys.idProduct],
                sellerId: data[ParamsKeys.sellerIdKey]));
      case RouteNames.detailstorepage:
        final data = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => DetailStore(
                sellerId: data[ParamsKeys.sellerIdKey],
                sellerName: data[ParamsKeys.sellerNameKey]));
      case RouteNames.checkoutorderpage:
        final data = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) =>
                CheckoutOrder(data: data[ParamsKeys.checkoutdatakey]));
      case RouteNames.searchpage:
        return MaterialPageRoute(builder: (context) => const SearchPage());
      case RouteNames.orderpage:
        return MaterialPageRoute(builder: (context) => const OrderPage());
      case RouteNames.wishlistpage:
        return MaterialPageRoute(builder: (context) => const WishlistPage());
      case RouteNames.detailwishlistpage:
        final data = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) =>
              DetailWishlist(data: data[ParamsKeys.groupCartModel]),
        );
      case RouteNames.notificationpage:
        return MaterialPageRoute(
            builder: (context) => const NotificationPage());
      case RouteNames.detailcategory:
        final data = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) =>
                DetailCategory(category: data[ParamsKeys.title]));
      case RouteNames.cartorderpage:
        return MaterialPageRoute(builder: (context) => const CartOrder());
      default:
        return MaterialPageRoute(builder: (context) => const SizedBox.shrink());
    }
  }
}

class RouteNames {
  RouteNames._();
  static const String root = '/';
  static const String landingpage = '/landingpage';
  static const String registerpage = '/registerpage';
  static const String loginpage = '/loginpage';
  static const String homepage = '/homepage';
  static const String mainpage = '/mainpage';
  static const String detailitempage = '/detailitempage';
  static const String focustcommentpage = '/focustcommentpage';
  static const String showmorecomments = '/showmorecomments';
  static const String detailcategory = '/detailcategory';
  static const String searchpage = '/searchpage';
  static const String wishlistpage = '/wishlistpage';
  static const String detailwishlistpage = '/detailwishlistpage';
  static const String orderpage = '/orderpage';
  static const String notificationpage = '/notificationpage';
  static const String detailstorepage = '/detailstorepage';
  static const String cartorderpage = '/cartorderpage';
  static const String checkoutorderpage = '/checkoutorderpage';
}
