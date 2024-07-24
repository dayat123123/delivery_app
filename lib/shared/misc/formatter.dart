import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/misc/constans.dart';
import 'package:flutter/material.dart';
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

  static String formatRatingWithTotal(double rating, int total) {
    return "$rating ($total)";
  }

  static String formatEstimationTime(int estimationTime) {
    //in minutes
    if (estimationTime >= 60) {
      if (estimationTime % 60 == 0) {
        int hours = estimationTime ~/ 60;
        return "$hours hours";
      } else {
        int hours = estimationTime ~/ 60;
        int remainingMinutes = estimationTime % 60;
        return "$hours hours $remainingMinutes mins";
      }
    } else {
      return "$estimationTime mins";
    }
  }

  static Widget formatRating(BuildContext context,
      {double iconSize = 20,
      double? fontSize,
      required double rating,
      Color? fontColor}) {
    return Row(children: [
      Icon(Icons.star, color: context.themeColors.neutral, size: iconSize)
          .marginOnly(right: 5),
      Text(rating.toString(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: fontColor))
    ]);
  }

  static Widget formatIsDiscon(BuildContext context,
      {required double price,
      required double discount,
      double? fontSize,
      int maxLines = 2}) {
    if (discount > 0.0) {
      return RichText(
          maxLines: maxLines,
          text: TextSpan(
              text: formatPrice(price),
              style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: context.textTheme.bodyLarge?.color,
                  fontSize: fontSize),
              children: [
                TextSpan(
                    text: " ${formatDiscon(discount, price)}",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                        color: context.textTheme.bodyLarge?.color,
                        fontSize: fontSize))
              ]));
    } else {
      return Text(formatPrice(price),
          style: TextStyle(
              color: context.textTheme.bodyLarge?.color,
              fontWeight: FontWeight.w500,
              fontSize: fontSize));
    }
  }

  static String obscureName(String name, {bool isHide = true}) {
    if (!isHide) return name;
    if (name.length <= 2) return name;
    String firstChar = name[0];
    String lastChar = name[name.length - 1];
    String obscuredPart = '*' * (name.length - 2);
    return '$firstChar$obscuredPart$lastChar';
  }
}
