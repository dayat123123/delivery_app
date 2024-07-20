import 'package:delivery_app/injector.dart';
import 'package:delivery_app/features/authentication/bloc/auth_bloc.dart';
import 'package:delivery_app/shared/misc/file_paths.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/features/authentication/domain/usecases/login/login.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/misc/app_pages.dart';
import 'package:delivery_app/shared/widgets/button.dart';
import 'package:delivery_app/shared/widgets/progress_indicator.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:delivery_app/shared/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _focusNodeEmail = FocusNode();
  final _focusNodePassword = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _authBloc = inject.get<AuthenticationBloc>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodeEmail.canRequestFocus = true;
      _focusNodeEmail.requestFocus();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appbar: AppBar(
          title: const Text('Sign In'),
        ),
        body: Column(
          children: [
            SvgPicture.asset(FilePaths.signInimagessvg,
                width: context.fullWidth, height: context.fullHeight * 0.25),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Sign In",
                  style: context.textTheme.headlineLarge
                      ?.copyWith(fontSize: 22, fontWeight: FontWeight.bold)),
              TextSpan(
                  text: "\nPlease sign in to continue",
                  style: context.textTheme.headlineLarge
                      ?.copyWith(fontSize: 16, height: 1.5)),
            ])).centerLeft.marginOnly(bottom: 15),
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextField(
                          onTapOutside: () {
                            if (_emailController.text.isNotEmpty) {
                              _focusNodePassword.canRequestFocus = true;
                              _focusNodePassword.requestFocus();
                            }
                          },
                          onFieldSubmitted: (val) {
                            if (val.isNotEmpty) {
                              _focusNodePassword.canRequestFocus = true;
                              _focusNodePassword.requestFocus();
                            }
                          },
                          focusNode: _focusNodeEmail,
                          validator: (val) => emailValidator(val),
                          textFieldType: TextFieldType.email,
                          controller: _emailController)
                      .marginOnly(bottom: 15),
                  CustomTextField(
                          focusNode: _focusNodePassword,
                          validator: (val) => passwordValidator(val),
                          textFieldType: TextFieldType.password,
                          controller: _passwordController)
                      .marginOnly(bottom: 10),
                  CustomButton(
                    text: 'Forget Password?',
                    height: 40,
                    buttonType: ButtonType.textbutton,
                    onPressed: () {
                      context.showCustomSnackbar(
                          description: "Coming soon",
                          type: DialogAccentType.info);
                    },
                  ).marginOnly(bottom: 15),
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                      if (state is AuthenticationLoading) {
                        return progressIndicatorWidget(
                                strokeWidth: 2, context: context)
                            .center;
                      } else {
                        return CustomButton(
                            text: 'Sign In',
                            height: 50,
                            fontsize: 18,
                            fontWeight: FontWeight.bold,
                            width: context.fullWidth,
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                _authBloc.add(SignInButtonPressed(
                                    loginParams: LoginParams(
                                        email: _emailController.text,
                                        password: _passwordController.text)));
                              } else {
                                context.showSnackbar(
                                    'Forms are not valid, please check again');
                              }
                            });
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Don't have an account?",
                  style:
                      context.textTheme.headlineLarge?.copyWith(fontSize: 15)),
              CustomButton(
                  text: "Sign Up here",
                  buttonType: ButtonType.textbutton,
                  onPressed: () => context.pushNamed(RouteNames.registerpage))
            ])
          ],
        ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
