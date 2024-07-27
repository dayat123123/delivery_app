import 'package:delivery_app/features/wishlish/domain/entities/cart_model.dart';
import 'package:delivery_app/features/big_promo/domain/entities/big_promo_model.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/misc/formatter.dart';
import 'package:delivery_app/shared/misc/params_keys.dart';
import 'package:delivery_app/shared/misc/app_pages.dart';
import 'package:delivery_app/shared/widgets/card_container.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:delivery_app/shared/widgets/network_image.dart';
import 'package:delivery_app/shared/widgets/shimmer.dart';
import 'package:flutter/material.dart';

class CardBigPromo extends StatelessWidget {
  final BigPromoModel? bigPromoModel;
  final bool isLoading;
  const CardBigPromo({super.key, this.bigPromoModel, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
        onTap: () {
          if (bigPromoModel != null) {
            context.pushNamed(RouteNames.detailitempage, arguments: {
              ParamsKeys.cartProduct: CartModel(
                  productId: bigPromoModel!.idProduct,
                  productName: bigPromoModel!.namaProduct,
                  productPrice: bigPromoModel!.hargaProduct,
                  productImage: bigPromoModel!.imageUrl)
            });
          }
        },
        child: isLoading
            ? _isLoadingwidget(context)
            : Row(children: [
                Banner(
                    location: BannerLocation.topEnd,
                    message: Formatter.disconPercentage(
                        bigPromoModel?.discount ?? 0),
                    color: context.theme.primaryColor,
                    layoutDirection: TextDirection.ltr,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 13),
                    child: SizedBox(
                        width: context.fullWidth * 0.4,
                        child: CustomNetworkImage(
                            borderRadius: StyleHelpers.borderRadius,
                            networkImgUrl: bigPromoModel?.imageUrl))),
                Expanded(
                    child: Container(
                        padding: StyleHelpers.allPadding,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(bigPromoModel?.namaProduct ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              const Text("Rumah makan setia budi indah",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      TextStyle(fontWeight: FontWeight.w400)),
                              const Spacer(),
                              Text(
                                  Formatter.formatTotalSell(
                                      bigPromoModel?.terjual ?? 0),
                                  maxLines: 1,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500)),
                              Formatter.formatIsDiscon(context,
                                  price: bigPromoModel?.hargaProduct ?? 0,
                                  discount: bigPromoModel?.discount ?? 0)
                            ])))
              ]));
  }

  Widget _isLoadingwidget(BuildContext context) {
    return Row(children: [
      Container(
          width: context.fullWidth * 0.4,
          alignment: Alignment.center,
          padding: StyleHelpers.allPadding,
          decoration: BoxDecoration(
              color:
                  context.themeColors.appContainerBackground.withOpacity(0.85),
              borderRadius: BorderRadius.circular(StyleHelpers.borderRadius)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                CustomShimmer(width: context.fullWidth / 5, height: 12),
                const SizedBox(height: 15),
                CustomShimmer(width: context.fullWidth / 4, height: 12),
                const SizedBox(height: 15),
                CustomShimmer(width: context.fullWidth / 4, height: 12)
              ])),
      Expanded(
          child: CustomShimmer(
              width: context.fullWidth,
              child: Container(
                  width: context.fullWidth / 1.6,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(StyleHelpers.borderRadius),
                          bottomRight:
                              Radius.circular(StyleHelpers.borderRadius))))))
    ]);
  }
}
