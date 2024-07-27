import 'package:delivery_app/features/favorit/domain/entities/cart_model.dart';
import 'package:delivery_app/features/detail_toko/domain/entities/categories_toko_model.dart';
import 'package:delivery_app/features/detail_toko/domain/entities/product_toko_model.dart';
import 'package:delivery_app/features/detail_toko/presentation/pages/tabs/about_toko.dart';
import 'package:delivery_app/features/detail_toko/presentation/pages/tabs/all_product_toko.dart';
import 'package:delivery_app/features/detail_toko/presentation/pages/tabs/categories_toko.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/misc/app_pages.dart';
import 'package:delivery_app/shared/misc/formatter.dart';
import 'package:delivery_app/shared/misc/params_keys.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:delivery_app/shared/widgets/card_container.dart';
import 'package:delivery_app/shared/widgets/network_image.dart';
import 'package:delivery_app/shared/widgets/shimmer.dart';
import 'package:delivery_app/shared/widgets/sliver_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<CustomTabModel> listTabDetailStore(
    {List<ProductTokoModel>? listProduct,
    List<CategoriesTokoModel>? listCategories,
    bool isloadingAboutStore = false,
    bool isloadingAllProduct = false,
    bool isloadingCategories = false}) {
  return [
    CustomTabModel(
        title: "About Store",
        child: AboutToko(
          isLoading: isloadingAboutStore,
        )),
    CustomTabModel(
        title: "Products",
        child: AllProductToko(
          data: listProduct ?? [],
          isLoading: isloadingAllProduct,
        )),
    CustomTabModel(
        title: "Categories",
        child: CategoriesToko(
          data: listCategories ?? [],
          isLoading: isloadingCategories,
        ))
  ];
}

Widget cardCategoriesDetailToko(
    CategoriesTokoModel data, BuildContext context) {
  return CardContainer(
      withBottomMargin: false,
      onTap: () {
        context.showCustomSnackbar(description: "ini ${data.categoriName}");
      },
      borderRadius: 5,
      height: 100,
      child: Text(data.categoriName));
}

Widget cardCategoriesDetailTokoIsloading(BuildContext context) {
  return CardContainer(
      withBottomMargin: false,
      height: 100,
      child:
          CustomShimmer(height: context.fullHeight, width: context.fullWidth));
}

Widget cardProductDetailToko(ProductTokoModel data, BuildContext context) {
  bool isWrapBanner = data.discount > 0.0;
  return CardContainer(
          onTap: () => context.pushNamed(RouteNames.detailitempage, arguments: {
                ParamsKeys.cartProduct: CartModel(
                    productId: data.idProduct,
                    productName: data.namaProduct,
                    productPrice: data.hargaProduct,
                    productImage: data.imageUrl)
              }),
          borderRadius: 5,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: CustomNetworkImage(
                        networkImgUrl: data.imageUrl,
                        width: context.fullWidth,
                        borderRadiusCustom: const BorderRadius.only(
                            bottomLeft:
                                Radius.circular(StyleHelpers.borderRadius),
                            bottomRight:
                                Radius.circular(StyleHelpers.borderRadius)))),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.namaProduct,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.5)),
                      Formatter.formatIsDiscon(context,
                          price: data.hargaProduct, discount: data.discount),
                      Row(children: [
                        Formatter.formatRating(context, rating: data.rating),
                        const Spacer(),
                        Text(Formatter.formatTotalSell(data.jumTerjual),
                            maxLines: 1,
                            style: const TextStyle(fontWeight: FontWeight.w500))
                      ])
                    ]).paddingAll(StyleHelpers.allPaddingNumber)
              ]))
      .wrapWithBanner(
          isWrap: isWrapBanner,
          messageBanner: Formatter.disconPercentage(data.discount));
}

Widget cardProductDetailTokoIsLoading(BuildContext context) {
  return CardContainer(
      withBottomMargin: false,
      borderRadius: 5,
      child:
          CustomShimmer(width: context.fullWidth, height: context.fullHeight));
}
