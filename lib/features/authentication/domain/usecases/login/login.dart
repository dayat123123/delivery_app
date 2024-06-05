import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/authentication/data/repositories/authentication.dart';
import 'package:delivery_app/features/authentication/data/repositories/user_repository.dart';
import 'package:delivery_app/features/authentication/domain/entities/user.dart';
part 'login_params.dart';

class Login implements UseCase<Result<User>, LoginParams> {
  final Authentication authentication;
  final UserRepository userRepository;
  Login({required this.authentication, required this.userRepository});

  @override
  Future<Result<User>> call(LoginParams params) async {
    var idResult = await authentication.login(
        email: params.email, password: params.password);
    if (idResult is Success) {
      var userResult =
          await userRepository.getUser(uid: idResult.resultValue.toString());
      return switch (userResult) {
        Success(value: final user) => Result.success(user),
        Failed(:final message) => Result.failed(message),
      };
    } else {
      return Result.failed(idResult.errorMessage.toString());
    }
  }
}
