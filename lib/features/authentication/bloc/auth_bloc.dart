import 'package:delivery_app/app.dart';
import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/utils/storage_helper.dart';
import 'package:delivery_app/features/authentication/domain/entities/user.dart';
import 'package:delivery_app/features/authentication/domain/usecases/checkisLoggedin/check_is_loggedun.dart';
import 'package:delivery_app/features/authentication/domain/usecases/getLoggedinUser/get_loggedin_user.dart';
import 'package:delivery_app/features/authentication/domain/usecases/login/login.dart';
import 'package:delivery_app/features/authentication/domain/usecases/register/register.dart';
import 'package:delivery_app/shared/misc/params_key.dart';
import 'package:delivery_app/shared/misc/route_names.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'auth_bloc_state.dart';
part 'auth_bloc_event.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final Login login;
  final Register register;
  final CheckIsLoggedin checkIsLoggedin;
  final StorageHelper storageHelper;
  final Getloggedinuser getloggedinuser;
  AuthenticationBloc(
      {required this.login,
      required this.storageHelper,
      required this.register,
      required this.checkIsLoggedin,
      required this.getloggedinuser})
      : super(AuthenticationUninitialized()) {
    on<AuthenticationCheckIsLoginEvent>(_onAppStarted);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
    on<SignInButtonPressed>(_onSignInButtonPressed);
  }
  void _onAppStarted(AuthenticationCheckIsLoginEvent event,
      Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    await checkIsLoggedin(null).then((value) {
      if (value is Success) {
        add(SignInButtonPressed(loginParams: value.resultValue!));
      } else {
        navigatorKey.currentState?.context
            .pushNamedAndRemoveUntil(RouteNames.landingpage);
        emit(AuthenticationUnauthenticated());
      }
    }).catchError((error) {
      navigatorKey.currentState?.context
          .pushNamedAndRemoveUntil(RouteNames.landingpage);
      emit(AuthenticationUnauthenticated());
    });
  }

  void _onLoggedIn(LoggedIn event, Emitter<AuthenticationState> emit) async {
    storageHelper.write(ParamsKey.loginparamkey, {
      ParamsKey.emailKey: event.loginParams.email,
      ParamsKey.passwordKey: event.loginParams.password
    });
  }

  void _onLoggedOut(LoggedOut event, Emitter<AuthenticationState> emit) async {}

  void _onSignInButtonPressed(
      SignInButtonPressed event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    await login(event.loginParams).then((result) {
      if (result is Success) {
        User data = result.resultValue!;
        navigatorKey.currentState?.context.showToast(
            'Success login ${data.name}',
            type: DialogAccentType.success,
            postion: ToastGravity.TOP);
        add(LoggedIn(user: data, loginParams: event.loginParams));
        navigatorKey.currentState?.context
            .pushNamedAndRemoveUntil(RouteNames.mainpage);
        emit(AuthenticationAuthenticated(user: data));
      } else {
        navigatorKey.currentState?.context.showToast(result.errorMessage ?? "",
            postion: ToastGravity.TOP, type: DialogAccentType.failed);
      }
    }).catchError((error) {
      navigatorKey.currentState?.context.showToast(error.toString(),
          postion: ToastGravity.TOP, type: DialogAccentType.failed);
    });
    emit(AuthenticationUnauthenticated());
  }
}
