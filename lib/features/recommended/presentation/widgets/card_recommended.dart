import 'package:delivery_app/features/wishlish/domain/entities/cart_model.dart';
import 'package:delivery_app/features/recommended/domain/entities/recommended.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/misc/app_pages.dart';
import 'package:delivery_app/shared/misc/formatter.dart';
import 'package:delivery_app/shared/misc/params_keys.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:delivery_app/shared/widgets/card_container.dart';
import 'package:delivery_app/shared/widgets/network_image.dart';
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
        isLoading: isLoading,
        onTap: () {
          if (recommendedModel != null) {
            context.pushNamed(RouteNames.detailitempage, arguments: {
              ParamsKeys.cartProduct: CartModel(
                  productId: recommendedModel!.idProduct,
                  productName: recommendedModel!.namaProduct,
                  productPrice: recommendedModel!.hargaProduct,
                  productImage: recommendedModel!.imageUrl)
            });
          }
        },
        width: width,
        child: Column(children: [
          Expanded(
              child: CustomNetworkImage(
                  borderRadius: StyleHelpers.borderRadius,
                  shape: CustomNetworkImageShape.rounded,
                  networkImgUrl: recommendedModel?.imageUrl)),
          Wrap(children: [
            Text(recommendedModel?.namaProduct ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15.5))
                .centerLeft,
            Text(Formatter.formatPrice(recommendedModel?.hargaProduct ?? 0),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w500))
                .centerLeft,
            Row(children: [
              Formatter.formatRating(context,
                  rating: recommendedModel?.rating ?? 0),
              const Spacer(),
              Text(Formatter.formatTotalSell(recommendedModel?.jumTerjual ?? 0),
                      maxLines: 1,
                      style: const TextStyle(fontWeight: FontWeight.w500))
                  .centerLeft
            ])
          ]).paddingAll(StyleHelpers.allPaddingNumber)
        ]));
  }
}
