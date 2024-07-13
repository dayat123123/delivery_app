import 'package:delivery_app/features/popular_now/domain/entities/popular_now.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/misc/app_pages.dart';
import 'package:delivery_app/shared/misc/params_keys.dart';
import 'package:delivery_app/shared/misc/file_paths.dart';
import 'package:delivery_app/shared/misc/spacer_helpers.dart';
import 'package:delivery_app/shared/widgets/card_container.dart';
import 'package:flutter/material.dart';

class CardPopular extends StatelessWidget {
  final PopularNowModel? produkModel;
  final bool isLoading;
  const CardPopular({super.key, this.produkModel, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    const double width = 180;
    return CardContainer(
        padding: SpacerHelper.allPadding,
        isLoading: isLoading,
        onTap: () {
          if (produkModel?.idProduct != null) {
            context.pushNamed(RouteNames.detailitempage,
                arguments: {ParamsKeys.idProduct: produkModel?.idProduct});
          }
        },
        width: width,
        child: Stack(
          children: [
            Positioned(
                right: 0,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.favorite, color: context.themeColors.downward),
                  Text("${produkModel?.jumSave ?? ""}")
                ])),
            Column(children: [
              Expanded(
                  child: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage(
                          produkModel?.imageUrl ?? FilePaths.alljpg))),
              Text(produkModel?.namaProduct ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.5))
                  .centerLeft,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Rp. ${produkModel?.hargaProduct ?? ""}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w500))
                    .centerLeft,
                Text("${produkModel?.jumTerjual ?? ""} Sell",
                        maxLines: 1,
                        style: const TextStyle(fontWeight: FontWeight.w500))
                    .centerLeft
              ])
            ])
          ],
        )).marginOnly(right: SpacerHelper.rightMargin);
  }
}
