import 'package:delivery_app/core/utils/local_database/cart_model.dart';
import 'package:delivery_app/features/popular_now/domain/entities/popular_now.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/theme_extensions/theme.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/misc/app_pages.dart';
import 'package:delivery_app/shared/misc/formatter.dart';
import 'package:delivery_app/shared/misc/params_keys.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:delivery_app/shared/widgets/card_container.dart';
import 'package:delivery_app/shared/widgets/network_image.dart';
import 'package:flutter/material.dart';

class CardPopular extends StatelessWidget {
  final PopularNowModel? produkModel;
  final bool isLoading;
  const CardPopular({super.key, this.produkModel, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    const double width = 180;
    return CardContainer(
        isLoading: isLoading,
        onTap: () {
          if (produkModel != null) {
            context.pushNamed(RouteNames.detailitempage, arguments: {
              ParamsKeys.cartProduct: CartModel(
                  productId: produkModel!.idProduct,
                  productName: produkModel!.namaProduct,
                  productImage: produkModel!.imageUrl)
            });
          }
        },
        width: width,
        child: Stack(
          children: [
            Column(children: [
              Expanded(
                  child: CustomNetworkImage(
                      borderRadius: StyleHelpers.borderRadius,
                      shape: CustomNetworkImageShape.rounded,
                      networkImgUrl: produkModel?.imageUrl)),
              Wrap(
                children: [
                  Text(produkModel?.namaProduct ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.5))
                      .centerLeft,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                                Formatter.formatPrice(
                                    produkModel?.hargaProduct ?? 0),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500))
                            .centerLeft,
                        Text(
                                Formatter.formatTotalSell(
                                    produkModel?.jumTerjual ?? 0),
                                maxLines: 1,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500))
                            .centerLeft
                      ])
                ],
              ).paddingAll(StyleHelpers.allPaddingNumber)
            ]),
            Positioned(
                top: 5,
                right: 5,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.favorite, color: context.themeColors.downward),
                  Text("${produkModel?.jumSave ?? "0"}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, color: AppColors.white))
                ])),
          ],
        ));
  }
}
