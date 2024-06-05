import 'dart:io';
import 'package:delivery_app/features/authentication/domain/entities/user.dart';

class UploadProfilePictureParams {
  final File imageFile;
  final User user;
  UploadProfilePictureParams({required this.imageFile, required this.user});
}
