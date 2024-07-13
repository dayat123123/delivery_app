import 'package:delivery_app/shared/misc/constans.dart';

class RegisterParams {
  final String name;
  final String email;
  final String password;
  final String photoUrl;
  final AccountType accountType;
  RegisterParams(this.accountType,
      {required this.name,
      required this.email,
      required this.password,
      required this.photoUrl});
}
