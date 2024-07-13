import 'package:delivery_app/shared/misc/params_keys.dart';

class Formatter {
  Formatter._();
  static int enumAccountTypetoint(AccountType type) {
    int value;
    switch (type) {
      case AccountType.user:
        value = 0;
        break;
      case AccountType.admin:
        value = 1;
        break;
      default:
        value = 2;
        break;
    }
    return value;
  }
}
