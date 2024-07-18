import 'package:delivery_app/shared/misc/constans.dart';
import 'package:intl/intl.dart';

class Formatter {
  Formatter._();
  static final formatter =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
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
    String formatted = formatter.format(price);
    if (formatted.endsWith(',00')) {
      formatted = formatted.substring(0, formatted.length - 3);
    }
    return formatted;
  }

  static String formatTotalSell(int value) {
    return "$value Sold";
  }

  static String disconPercentage(double discon) {
    if (discon < 0) return "";
    return "${discon.toInt()}% off";
  }

  static String formatDiscon(double discon, double harga) {
    double getDiscon = harga * discon / 100;
    double getHasil = harga - getDiscon;

    String formattedHasil = getHasil % 1 == 0
        ? getHasil.toStringAsFixed(0)
        : getHasil.toStringAsFixed(2);

    String formatted = formatter.format(double.parse(formattedHasil));

    if (formatted.endsWith(',00')) {
      formatted = formatted.substring(0, formatted.length - 3);
    }
    return formatted;
  }
}
