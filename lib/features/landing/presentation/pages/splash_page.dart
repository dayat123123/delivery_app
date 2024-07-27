import 'package:delivery_app/injector.dart';
import 'package:delivery_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/progress_indicator.dart';
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
    _authBloc.add(const CheckIsLoginEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Transform.scale(
                scale: 1.5,
                child:
                    progressIndicatorWidget(strokeWidth: 5, context: context))
            .center);
  }
}
