import 'package:delivery_app/shared/misc/constans.dart';

class Formatter {
  Formatter._();
  static int enumAccountTypetoint(AccountType type) {
    int value;
    switch (type) {
      case AccountType.user:
        value = user;
        break;
      case AccountType.admin:
        value = admin;
        break;
      case AccountType.superadmin:
        value = superuser;
        break;
    }
    return value;
  }
}
