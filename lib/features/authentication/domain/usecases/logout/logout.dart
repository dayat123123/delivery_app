import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/authentication/data/repositories/authentication.dart';

class Logout implements UseCase<Result<void>, void> {
  final Authentication authentication;
  const Logout({required this.authentication});
  @override
  Future<Result<void>> call(void _) {
    return authentication.logout();
  }
}
