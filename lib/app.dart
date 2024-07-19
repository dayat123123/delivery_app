import 'package:delivery_app/features/authentication/bloc/auth_bloc.dart';
import 'package:delivery_app/shared/extensions/theme_extensions/theme_cubit.dart';
import 'package:delivery_app/injector.dart';
import 'package:delivery_app/shared/features/save_and_remove_favorit/bloc/favorite_bloc.dart';
import 'package:delivery_app/shared/misc/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => inject.get<ThemeCubit>()),
          BlocProvider(create: (context) => inject.get<AuthenticationBloc>()),
          BlocProvider(create: (context) => inject.get<FavoriteBloc>())
        ],
        child: BlocBuilder<ThemeCubit, ThemeData>(builder: (context, state) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
              value: state.appBarTheme.systemOverlayStyle ??
                  SystemUiOverlayStyle.light,
              child: MaterialApp(
                  theme: state,
                  debugShowCheckedModeBanner: false,
                  navigatorKey: navigatorKey,
                  initialRoute: RouteNames.root,
                  onGenerateRoute: (settings) =>
                      AppPages.generateRoute(settings)));
        }));
  }
}
