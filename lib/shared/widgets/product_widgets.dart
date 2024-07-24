import 'package:delivery_app/core/utils/location/location_model.dart';
import 'package:delivery_app/features/detail_product/domain/entities/comment_model.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/misc/app_pages.dart';
import 'package:delivery_app/shared/misc/formatter.dart';
import 'package:delivery_app/shared/misc/params_keys.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:delivery_app/shared/widgets/card_container.dart';
import 'package:delivery_app/shared/widgets/network_image.dart';
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

Widget sellerNameWidget(
    BuildContext context, String sellerName, String sellerId,
    {TextStyle? style, double? size}) {
  return GestureDetector(
      onTap: () => context.pushNamed(RouteNames.detailstorepage, arguments: {
            ParamsKeys.sellerIdKey: sellerId,
            ParamsKeys.sellerNameKey: sellerName
          }),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.storefront,
                color: context.theme.primaryColor, size: size),
            const SizedBox(width: 5),
            Expanded(
                child: Text(sellerName,
                    maxLines: 2,
                    style: style ??
                        const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400)))
          ]));
}

Widget ratingWidget(BuildContext context,
    {required double rating, required int totalReviewers}) {
  return Row(children: [
    Icon(Icons.star, color: context.themeColors.neutral),
    const SizedBox(width: 5),
    Text(Formatter.formatRatingWithTotal(rating, totalReviewers),
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
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: context.textTheme.headlineLarge?.color))
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

Widget stockWidget(BuildContext context, {required int stock}) {
  return Row(children: [
    const Text("Stock: ",
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
    const SizedBox(width: 5),
    Text(stock.toString(),
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15))
  ]);
}

Widget commentWidget(BuildContext context,
    {required List<CommentModel> listComments}) {
  return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) =>
          cardComment(context, data: listComments[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 5),
      itemCount: listComments.length);
}

Widget cardComment(BuildContext context, {required CommentModel data}) {
  return CardContainer(
      child: ListTile(
          contentPadding: StyleHelpers.horizontalPadding,
          isThreeLine: true,
          leading: Container(
              alignment: Alignment.topLeft,
              width: 30,
              height: 30,
              child: CustomNetworkImage(
                  networkImgUrl: data.imageUrlAccount,
                  radius: 15,
                  shape: CustomNetworkImageShape.circle)),
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    Formatter.obscureName(data.commentAccount,
                        isHide: data.isHideAccountId),
                    style: const TextStyle(fontSize: 12)),
                const Spacer(),
                helpFulWidget(context, value: data.isHelps, onTap: () {})
              ]),
          subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Formatter.formatRating(context,
                    rating: data.rating, fontSize: 12),
                const SizedBox(height: 5),
                Text(data.commentDesc, style: const TextStyle(fontSize: 12)),
                const SizedBox(height: 5),
                if (data.listFotoComments?.isNotEmpty ?? false)
                  GridView.builder(
                      padding: const EdgeInsets.only(top: 5),
                      shrinkWrap: true,
                      itemCount: data.listFotoComments?.length ?? 0,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1.3,
                              crossAxisCount: 2,
                              crossAxisSpacing: 3,
                              mainAxisSpacing: 3),
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () => context.pushNamed(
                                RouteNames.focustcommentpage,
                                arguments: {
                                  ParamsKeys.indexImageKey: index,
                                  ParamsKeys.commentDataKey: data
                                }),
                            child: CustomNetworkImage(
                                borderRadius: 5,
                                networkImgUrl: data.listFotoComments?[index]),
                          ))
              ])));
}

Widget helpFulWidget(BuildContext context,
    {required int value,
    double? iconSize,
    double? fontSize,
    void Function()? onTap}) {
  return CardContainer(
      onTap: onTap,
      child: Row(children: [
        Icon(Icons.thumb_up_sharp, size: iconSize ?? 15),
        const SizedBox(width: 5),
        Text("Helpful($value)", style: TextStyle(fontSize: fontSize ?? 12))
      ]));
}
