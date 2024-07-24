import 'package:delivery_app/core/utils/local_database/group_order_cart_model.dart';
import 'package:delivery_app/core/utils/local_database/order_cart_model.dart';
import 'package:delivery_app/features/detail_product/domain/entities/product_model.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/misc/formatter.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:delivery_app/shared/widgets/button.dart';
import 'package:delivery_app/shared/widgets/card_container.dart';
import 'package:delivery_app/shared/widgets/network_image.dart';
import 'package:delivery_app/shared/widgets/product_widgets.dart';
import 'package:flutter/material.dart';

void addItemToCart(BuildContext context, {required DetailProductModel data}) {
  final themeColors = context.themeColors;
  context.showBottomSheet(
      basicBottomSheet: Container(
          padding: StyleHelpers.allPadding,
          margin: const EdgeInsets.only(bottom: 10),
          width: context.fullWidth,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                    height: 110,
                    width: context.fullWidth,
                    child: Row(children: [
                      SizedBox(
                          width: 110,
                          child: CustomNetworkImage(
                              borderRadius: 5, networkImgUrl: data.imageUrl)),
                      const SizedBox(width: 10),
                      Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(data.namaProduct,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17)),
                            stockWidget(context, stock: 100),
                          ]))
                    ])),
                const Divider(height: 30, thickness: 1.5),
                _partItemAddtoCart(
                    title: "Price",
                    widget: Text(Formatter.formatPrice(data.hargaProduct),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17))),
                const SizedBox(height: 15),
                _partItemAddtoCart(
                    title: "Quantity",
                    widget: CustomButton(
                        onChangedIncDecrButton: (p0) {},
                        buttonType: ButtonType.incrementAndDecrementButton,
                        initialValue: 1)),
                const SizedBox(height: 15),
                _partItemAddtoCart(
                    title: "Total Price",
                    widget: const Text("Rp. 100.000",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17))),
                const Spacer(),
                CardContainer(
                    onTap: () {
                      GroupOrderCartModel dataCart = generateDataCart(data, 1);
                    },
                    borderRadius: 5,
                    color: themeColors.downward,
                    height: 50,
                    width: context.fullWidth,
                    child: const Text("Add to Cart",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15))),
                const SizedBox(width: 10)
              ])));
}

Widget _partItemAddtoCart({required String title, required Widget widget}) =>
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
      widget
    ]);
GroupOrderCartModel generateDataCart(DetailProductModel data, int qty) {
  return GroupOrderCartModel(
      groupOrderCartId: data.sellerId,
      groupOrderCartName: data.sellerName,
      items: [
        OrderCartModel(
            productId: data.idProduct,
            productName: data.namaProduct,
            productPrice: data.hargaProduct,
            quantity: 1)
      ]);
}
