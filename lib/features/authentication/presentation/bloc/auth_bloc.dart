import 'package:delivery_app/app.dart';
import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/utils/storage_helper/storage_helper.dart';
import 'package:delivery_app/features/authentication/domain/entities/user.dart';
import 'package:delivery_app/features/authentication/domain/usecases/checkisLoggedin/check_is_loggedun.dart';
import 'package:delivery_app/features/authentication/domain/usecases/getLoggedinUser/get_loggedin_user.dart';
import 'package:delivery_app/features/authentication/domain/usecases/login/login.dart';
import 'package:delivery_app/features/authentication/domain/usecases/register/register.dart';
import 'package:delivery_app/dependency_injection.dart';
import 'package:delivery_app/shared/misc/params_keys.dart';
import 'package:delivery_app/shared/misc/app_pages.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_bloc_state.dart';
part 'auth_bloc_event.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final Login login = inject.get<Login>();
  final Register register = inject.get<Register>();
  final CheckIsLoggedin checkIsLoggedin = inject.get<CheckIsLoggedin>();
  final StorageHelper storageHelper = inject.get<StorageHelper>();
  final Getloggedinuser getloggedinuser = inject.get<Getloggedinuser>();
  AuthenticationBloc() : super(AuthenticationUninitialized()) {
    on<CheckIsLoginEvent>(_onAppStarted);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
    on<SignInButtonPressed>(_onSignInButtonPressed);
    on<SignInOnStarted>(_onSignInOnStarted);
  }
  void _onAppStarted(
      CheckIsLoginEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    await checkIsLoggedin(null).then((value) {
      if (value is Success) {
        add(SignInOnStarted(loginParams: value.resultValue!));
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
    await storageHelper.write(ParamsKeys.loginparamkey, {
      ParamsKeys.emailKey: event.loginParams.email,
      ParamsKeys.passwordKey: event.loginParams.password
    });
  }

  void _onLoggedOut(LoggedOut event, Emitter<AuthenticationState> emit) async {
    storageHelper.deleteData(ParamsKeys.loginparamkey);
    navigatorKey.currentContext?.pushNamedAndRemoveUntil(RouteNames.loginpage);
    emit(AuthenticationUnauthenticated());
  }

  void _onSignInButtonPressed(
      SignInButtonPressed event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    await login(event.loginParams).then((result) {
      if (result is Success) {
        User data = result.resultValue!;
        navigatorKey.currentState?.context.showCustomSnackbar(
            description: 'Login id ${data.name}',
            type: DialogAccentType.success);
        add(LoggedIn(user: data, loginParams: event.loginParams));
        navigatorKey.currentState?.context
            .pushNamedAndRemoveUntil(RouteNames.mainpage);
        emit(AuthenticationAuthenticated(user: data));
      } else {
        navigatorKey.currentState?.context.showCustomSnackbar(
            description: result.errorMessage ?? "",
            type: DialogAccentType.failed);
        emit(AuthenticationUnauthenticated());
      }
    }).catchError((error) {
      navigatorKey.currentState?.context.showCustomSnackbar(
          description: error.toString(), type: DialogAccentType.failed);
      emit(AuthenticationUnauthenticated());
    });
  }

  void _onSignInOnStarted(
      SignInOnStarted event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    await login(event.loginParams).then((result) {
      if (result is Success) {
        User data = result.resultValue!;
        navigatorKey.currentState?.context.showCustomSnackbar(
            description: 'Login id ${data.name}',
            type: DialogAccentType.success);
        add(LoggedIn(user: data, loginParams: event.loginParams));
        navigatorKey.currentState?.context
            .pushNamedAndRemoveUntil(RouteNames.mainpage);
        emit(AuthenticationAuthenticated(user: data));
      } else {
        navigatorKey.currentState?.context.showCustomSnackbar(
            description: result.errorMessage ?? "",
            type: DialogAccentType.failed);
        navigatorKey.currentState?.context
            .pushNamedAndRemoveUntil(RouteNames.loginpage);
        emit(AuthenticationUnauthenticated());
      }
    }).catchError((error) {
      navigatorKey.currentState?.context.showCustomSnackbar(
          description: error.toString(), type: DialogAccentType.failed);
      navigatorKey.currentState?.context
          .pushNamedAndRemoveUntil(RouteNames.loginpage);
      emit(AuthenticationUnauthenticated());
    });
  }
}
