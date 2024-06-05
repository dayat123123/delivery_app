import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/authentication/data/repositories/authentication.dart';
import 'package:delivery_app/features/authentication/data/repositories/user_repository.dart';
import 'package:delivery_app/features/authentication/domain/entities/user.dart';

class Getloggedinuser implements UseCase<Result<User>, void> {
  final Authentication authentication;
  final UserRepository userRepository;
  Getloggedinuser({required this.authentication, required this.userRepository});
  @override
  Future<Result<User>> call(void _) async {
    String? loggedInuser = authentication.getLoggedInUser();
    if (loggedInuser != null) {
      var result = await userRepository.getUser(uid: loggedInuser);
      if (result.isSuccess) {
        return Result.success(result.resultValue!);
      } else {
        return Result.failed(result.errorMessage.toString());
      }
    } else {
      return const Result.failed('No user logged in');
    }
  }
}
