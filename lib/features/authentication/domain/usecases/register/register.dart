import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/authentication/data/repositories/authentication.dart';
import 'package:delivery_app/features/authentication/data/repositories/user_repository.dart';
import 'package:delivery_app/features/authentication/domain/entities/user.dart';
import 'package:delivery_app/features/authentication/domain/usecases/register/register_params.dart';
import 'package:firebase_core/firebase_core.dart';

class Register implements UseCase<Result<User>, RegisterParams> {
  final Authentication authentication;
  final UserRepository userRepository;
  Register({required this.authentication, required this.userRepository});

  @override
  Future<Result<User>> call(RegisterParams params) async {
    try {
      var uidResult = await authentication.register(
          email: params.email, password: params.password);
      if (uidResult.isSuccess) {
        var userResult = await userRepository.createUser(
            accountType: params.accountType,
            uid: uidResult.resultValue!,
            email: params.email,
            password: params.password,
            name: params.email,
            photoUrl: params.photoUrl);
        if (userResult.isSuccess) {
          return Result.success(userResult.resultValue!);
        } else {
          return Result.failed(userResult.errorMessage!);
        }
      } else {
        return Result.failed(uidResult.errorMessage.toString());
      }
    } on FirebaseException catch (e) {
      return Result.failed(e.message.toString());
    }
  }
}
