import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/utils/storage_helper/storage_helper.dart';
import 'package:delivery_app/features/authentication/data/repositories/authentication.dart';
import 'package:delivery_app/features/authentication/domain/usecases/login/login.dart';
import 'package:delivery_app/shared/misc/params_keys.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class FirebaseAuthentication implements Authentication {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final StorageHelper _storageHelper;
  FirebaseAuthentication(
      {firebase_auth.FirebaseAuth? firebaseAuth,
      StorageHelper? fluterSecureStorage})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _storageHelper = fluterSecureStorage ?? StorageHelper();
  @override
  String? getLoggedInUser() {
    return _firebaseAuth.currentUser?.uid;
  }

  @override
  Future<Result<String>> login(
      {required String email, required String password}) async {
    try {
      var userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return Result.success(userCredential.user!.uid);
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Result.failed(e.message!);
    }
  }

  @override
  Future<Result<void>> logout() async {
    await _firebaseAuth.signOut();
    if (_firebaseAuth.currentUser == null) {
      return const Result.success(null);
    } else {
      return const Result.failed('Logout Failed');
    }
  }

  @override
  Future<Result<String>> register(
      {required String email, required String password}) async {
    try {
      var userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return Result.success(userCredential.user!.uid);
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Result.failed(e.message.toString());
    }
  }

  @override
  Future<Result<LoginParams?>> checkIsLogin() async {
    try {
      Map<String, dynamic>? loginParams =
          await _storageHelper.read(ParamsKeys.loginparamkey);
      if (loginParams == null) {
        return const Result.failed('No logged in user');
      } else {
        String email = loginParams[ParamsKeys.emailKey];
        String password = loginParams[ParamsKeys.passwordKey];
        if (email.isNotEmpty && password.isNotEmpty) {
          LoginParams result = LoginParams(email: email, password: password);
          return Result.success(result);
        } else {
          return const Result.failed('User data is empty');
        }
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
