part of 'auth_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class CheckIsLoginEvent extends AuthenticationEvent {
  const CheckIsLoginEvent();
  @override
  List<Object> get props => [];
}

class SignInButtonPressed extends AuthenticationEvent {
  final LoginParams loginParams;
  const SignInButtonPressed({required this.loginParams});

  @override
  List<Object> get props => [loginParams];
}

class SignInOnStarted extends AuthenticationEvent {
  final LoginParams loginParams;
  const SignInOnStarted({required this.loginParams});

  @override
  List<Object> get props => [loginParams];
}

class LoggedIn extends AuthenticationEvent {
  final User user;
  final LoginParams loginParams;
  const LoggedIn({required this.user, required this.loginParams});

  @override
  List<Object> get props => [user, loginParams];
}

class LoggedOut extends AuthenticationEvent {}
