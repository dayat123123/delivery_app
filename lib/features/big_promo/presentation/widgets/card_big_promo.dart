import 'package:delivery_app/features/big_promo/domain/entities/big_promo_model.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/misc/params_keys.dart';
import 'package:delivery_app/shared/misc/file_paths.dart';
import 'package:delivery_app/shared/misc/app_pages.dart';
import 'package:delivery_app/shared/widgets/card_container.dart';
import 'package:delivery_app/shared/misc/spacer_helpers.dart';
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
          if (bigPromoModel?.idProduct != null) {
            context.pushNamed(RouteNames.detailitempage,
                arguments: {ParamsKeys.idProduct: bigPromoModel?.idProduct});
          }
        },
        child: isLoading
            ? _isLoadingwidget(context)
            : Stack(children: [
                Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                        width: context.fullWidth / 1.6,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topRight:
                                    Radius.circular(SpacerHelper.borderRadius),
                                bottomRight:
                                    Radius.circular(SpacerHelper.borderRadius)),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(bigPromoModel?.imageUrl ??
                                    FilePaths.alljpg))))),
                Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                        width: context.fullWidth / 2.8,
                        decoration: BoxDecoration(
                            color: context.themeColors.appContainerBackground,
                            borderRadius: BorderRadius.circular(
                                SpacerHelper.borderRadius)))),
              ]));
  }

  Widget _isLoadingwidget(BuildContext context) {
    return Stack(children: [
      Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: CustomShimmer(
              width: context.fullWidth / 1.6,
              child: Container(
                  width: context.fullWidth / 1.6,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(SpacerHelper.borderRadius),
                          bottomRight:
                              Radius.circular(SpacerHelper.borderRadius)))))),
      Positioned(
        left: 0,
        top: 0,
        bottom: 0,
        child: Container(
          width: context.fullWidth / 2.8,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color:
                  context.themeColors.appContainerBackground.withOpacity(0.85),
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
        ),
      )
    ]);
  }
}
