import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/authentication/domain/usecases/login/login.dart';

abstract interface class Authentication {
  Future<Result<String>> register(
      {required String email, required String password});
  Future<Result<String>> login(
      {required String email, required String password});
  Future<Result<LoginParams?>> checkIsLogin();
  Future<Result<void>> logout();
  String? getLoggedInUser();
}
