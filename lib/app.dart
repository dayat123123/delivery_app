import 'package:delivery_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:delivery_app/features/cart_order/presentation/bloc/cart_order_bloc.dart';
import 'package:delivery_app/shared/extensions/theme_extensions/theme_cubit.dart';
import 'package:delivery_app/injector.dart';
import 'package:delivery_app/features/favorit/presentation/bloc/favorite_bloc.dart';
import 'package:delivery_app/shared/misc/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => inject.get<ThemeCubit>()),
        BlocProvider(create: (context) => inject.get<AuthenticationBloc>()),
        BlocProvider(create: (context) => inject.get<FavoriteBloc>()),
        BlocProvider(create: (context) => inject.get<CartOrderBloc>())
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(builder: (context, state) {
        final overlayStyle = state.appBarTheme.systemOverlayStyle!;
        return AnnotatedRegion<SystemUiOverlayStyle>(
            value: overlayStyle,
            child: MaterialApp(
                theme: state,
                debugShowCheckedModeBanner: false,
                navigatorKey: navigatorKey,
                initialRoute: RouteNames.root,
                onGenerateRoute: (settings) =>
                    AppPages.generateRoute(settings)));
      }),
    );
  }
}
