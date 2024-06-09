import 'package:delivery_app/features/big_promo/domain/entities/big_promo_model.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/misc/params_key.dart';
import 'package:delivery_app/shared/misc/pathfile.dart';
import 'package:delivery_app/shared/misc/route_names.dart';
import 'package:delivery_app/shared/widgets/shimmer.dart';
import 'package:delivery_app/shared/widgets/spacer.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/card.dart';

class CardBigPromo extends StatelessWidget {
  final BigPromoModel? bigPromoModel;
  final bool isLoading;
  const CardBigPromo({super.key, this.bigPromoModel, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        onTap: () {
          if (bigPromoModel?.idProduct != null) {
            context.pushNamed(RouteNames.detailitempage,
                arguments: {ParamsKey.idProduct: bigPromoModel?.idProduct});
          }
        },
        padding: EdgeInsets.zero,
        width: double.infinity,
        child: isLoading
            ? _isLoadingwidget(context)
            : Stack(children: [
                Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                        width: context.fullWidth / 1.5,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topRight:
                                    Radius.circular(SpacerHelper.borderRadius),
                                bottomRight:
                                    Radius.circular(SpacerHelper.borderRadius)),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(bigPromoModel?.imageUrl ??
                                    PathFile.alljpg))))),
                Container(
                    width: context.fullWidth / 3,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.5),
                        borderRadius:
                            BorderRadius.circular(SpacerHelper.borderRadius)))
              ]));
  }

  Widget _isLoadingwidget(BuildContext context) {
    return Stack(children: [
      Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: CustomShimmer(
              width: context.fullWidth / 1.5,
              child: Container(
                  width: context.fullWidth / 1.5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(SpacerHelper.borderRadius),
                          bottomRight:
                              Radius.circular(SpacerHelper.borderRadius)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              bigPromoModel?.imageUrl ?? PathFile.alljpg)))))),
      Container(
        width: context.fullWidth / 3,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: context.themeColors.appContainerBackground.withOpacity(0.85),
            borderRadius: BorderRadius.circular(SpacerHelper.borderRadius)),
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
          ],
        ),
      )
    ]);
  }
}
