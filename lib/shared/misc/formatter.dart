import 'package:delivery_app/shared/misc/constans.dart';
import 'package:intl/intl.dart';

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

  static String formatPrice(double price) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
    String formatted = formatter.format(price);
    if (formatted.endsWith(',00')) {
      formatted = formatted.substring(0, formatted.length - 3);
    }
    return formatted;
  }

  static String formatTotalSell(int value) {
    return "$value Sold";
  }
}
