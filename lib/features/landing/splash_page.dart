import 'package:delivery_app/injector.dart';
import 'package:delivery_app/features/authentication/bloc/auth_bloc.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _authBloc = inject.get<AuthenticationBloc>();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1),
        () => _authBloc.add(const AuthenticationCheckIsLoginEvent()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Transform.scale(
                scale: 1.5,
                child: CircularProgressIndicator(
                    strokeWidth: 5, color: context.theme.primaryColor))
            .center);
  }
}
