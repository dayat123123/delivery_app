import 'package:delivery_app/features/recommended/domain/entities/recommended.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/misc/app_pages.dart';
import 'package:delivery_app/shared/misc/params_keys.dart';
import 'package:delivery_app/shared/misc/file_paths.dart';
import 'package:delivery_app/shared/misc/spacer_helpers.dart';
import 'package:delivery_app/shared/widgets/card_container.dart';
import 'package:flutter/material.dart';

class CardRecommended extends StatelessWidget {
  final RecommendedModel? recommendedModel;
  final bool isLoading;
  const CardRecommended(
      {super.key, this.recommendedModel, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    const double width = 180;
    return CardContainer(
        padding: SpacerHelper.allPadding,
        isLoading: isLoading,
        onTap: () {
          if (recommendedModel?.idProduct != null) {
            context.pushNamed(RouteNames.detailitempage,
                arguments: {ParamsKeys.idProduct: recommendedModel?.idProduct});
          }
        },
        width: width,
        child: Column(children: [
          Expanded(
              child: CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage(
                      recommendedModel?.imageUrl ?? FilePaths.alljpg))),
          Text(recommendedModel?.namaProduct ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15.5))
              .centerLeft,
          Text("Rp. ${recommendedModel?.hargaProduct ?? 0}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w500))
              .centerLeft,
          Row(children: [
            ...[
              Icon(Icons.star, color: context.themeColors.neutral, size: 20)
                  .spaceH(before: false, after: true, spacing: 5),
              Text("${recommendedModel?.rating ?? 0}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w500))
                  .centerLeft,
              const Spacer(),
              Text("${recommendedModel?.jumTerjual ?? 0} Sell",
                      maxLines: 1,
                      style: const TextStyle(fontWeight: FontWeight.w500))
                  .centerLeft
            ]
          ])
        ])).marginOnly(right: SpacerHelper.rightMargin);
  }
}
