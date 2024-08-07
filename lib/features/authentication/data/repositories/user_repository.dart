import 'dart:io';

import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/authentication/domain/entities/user.dart';
import 'package:delivery_app/shared/misc/constans.dart';

abstract interface class UserRepository {
  Future<Result<User>> createUser(
      {required String uid,
      required String email,
      required String password,
      required String name,
      required AccountType accountType,
      String? photoUrl,
      int balance = 0});

  Future<Result<User>> getUser({required String uid});
  Future<Result<User>> updateUser({required User user});
  Future<Result<User>> uploadProfilePicture(
      {required User user, required File imageFile});
}
