import 'package:delivery_app/core/utils/location/location_model.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/misc/formatter.dart';
import 'package:delivery_app/shared/widgets/card_container.dart';
import 'package:flutter/material.dart';

Widget locationWidget(LocationModel location, BuildContext context,
    {TextStyle? style}) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.place, color: context.themeColors.downward),
        const SizedBox(width: 5),
        Expanded(
            child: Text(
                "Jalan teluk gong no 89F (${location.latitude}, ${location.longitude})",
                maxLines: 2,
                style: style ??
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w400)))
      ]);
}

Widget sellerNameWidget(BuildContext context, String sellerName,
    {TextStyle? style}) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.storefront, color: context.theme.primaryColor),
        const SizedBox(width: 5),
        Expanded(
            child: Text(sellerName,
                maxLines: 2,
                style: style ??
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w400)))
      ]);
}

Widget ratingWidget(BuildContext context, {required double rating}) {
  return Row(children: [
    Icon(Icons.star, color: context.themeColors.neutral),
    const SizedBox(width: 5),
    Text(Formatter.formatRatingWithTotal(rating, 100),
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500))
  ]);
}

Widget estimationTimeWidget(BuildContext context, {required int time}) {
  return CardContainer(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 25,
      color: context.themeColors.neutral,
      child: Row(children: [
        const Icon(Icons.timer, size: 20),
        const SizedBox(width: 5),
        Text(Formatter.formatEstimationTime(time),
            style: const TextStyle(fontWeight: FontWeight.w500))
      ]));
}

Widget soldWidget(BuildContext context, {required int sold}) {
  return Row(children: [
    Icon(Icons.sell_sharp, color: context.themeColors.neutral),
    const SizedBox(width: 5),
    Text(Formatter.formatTotalSell(sold),
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15))
  ]);
}
