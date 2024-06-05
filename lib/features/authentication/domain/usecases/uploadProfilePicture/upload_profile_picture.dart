import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/authentication/data/repositories/user_repository.dart';
import 'package:delivery_app/features/authentication/domain/entities/user.dart';
import 'package:delivery_app/features/authentication/domain/usecases/uploadProfilePicture/upload_profile_picture_params.dart';

class UploadProfilePicture
    implements UseCase<Result<User>, UploadProfilePictureParams> {
  final UserRepository userRepository;
  UploadProfilePicture({required this.userRepository});
  @override
  Future<Result<User>> call(UploadProfilePictureParams params) async {
    return userRepository.uploadProfilePicture(
        user: params.user, imageFile: params.imageFile);
  }
}
