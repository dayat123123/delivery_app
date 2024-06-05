import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/authentication/data/repositories/authentication.dart';
import 'package:delivery_app/features/authentication/domain/usecases/login/login.dart';

class CheckIsLoggedin implements UseCase<Result<LoginParams>, void> {
  final Authentication authentication;
  CheckIsLoggedin({required this.authentication});
  @override
  Future<Result<LoginParams>> call(void _) async {
    var getLoggedInUser = await authentication.checkIsLogin();
    if (getLoggedInUser is Success) {
      return Success(getLoggedInUser.resultValue!);
    } else {
      return Failed(getLoggedInUser.errorMessage!);
    }
  }
}
