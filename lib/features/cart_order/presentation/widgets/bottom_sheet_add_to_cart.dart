import 'package:delivery_app/features/cart_order/domain/entities/group_order_cart_model.dart';
import 'package:delivery_app/features/cart_order/domain/entities/order_cart_model.dart';
import 'package:delivery_app/features/cart_order/presentation/bloc/cart_order_bloc.dart';
import 'package:delivery_app/features/detail_product/domain/entities/product_model.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/misc/formatter.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:delivery_app/shared/widgets/button.dart';
import 'package:delivery_app/shared/widgets/card_container.dart';
import 'package:delivery_app/shared/widgets/network_image.dart';
import 'package:delivery_app/shared/widgets/product_widgets.dart';
import 'package:delivery_app/injector.dart';
import 'package:flutter/material.dart';

void addItemToCart(BuildContext context, {required DetailProductModel data}) {
  final themeColors = context.themeColors;
  int quantity = 1;
  double totalPrice = data.hargaProduct;
  final cartOrderBloc = inject.get<CartOrderBloc>();
  context.showBottomSheet(
      initialChildSize: 0.8,
      isScrollControlled: false,
      isScrollChild: false,
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: StyleHelpers.horizontalPadding,
                  height: 110,
                  width: double.infinity,
                  child: Row(children: [
                    SizedBox(
                        width: 110,
                        child: CustomNetworkImage(
                            borderRadius: 5, networkImgUrl: data.imageUrl)),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          sellerNameWidget(
                              withOnTap: false,
                              context,
                              data.sellerName,
                              data.sellerId),
                          Text(data.namaProduct,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                          stockWidget(context, stock: data.stockProduct),
                          Row(children: [
                            ratingWidget(context,
                                rating: data.rating,
                                totalReviewers: data.totalReviewers),
                            const SizedBox(width: 10),
                            totalSavedWidget(context, jumSave: data.jumSave)
                          ])
                        ]))
                  ])),
              Divider(
                  height: 35,
                  thickness: 1,
                  color: context.themeColors.appContainerShadow),
              Column(
                children: [
                  _partItemAddtoCart(
                      title: "Price",
                      widget: Text(Formatter.formatPrice(data.hargaProduct),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16))),
                  const SizedBox(height: 15),
                  _partItemAddtoCart(
                      title: "Quantity",
                      widget: CustomButton(
                          isAllowZero: false,
                          onChangedIncDecrButton: (p0) {
                            setState(() {
                              quantity = p0;
                              totalPrice = quantity * data.hargaProduct;
                            });
                          },
                          buttonType: ButtonType.incrementAndDecrementButton,
                          initialValue: 1)),
                  const SizedBox(height: 15),
                  _partItemAddtoCart(
                      title: "Total Price",
                      widget: Text(Formatter.formatPrice(totalPrice),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16))),
                  const SizedBox(height: 25),
                  CardContainer(
                      onTap: () => cartOrderBloc.add(InsertItemToCart(() {
                            context.pop();
                            context.showCustomSnackbar(
                                type: DialogAccentType.success,
                                title: "Success",
                                description: "Add item to cart");
                          }, data: generateDataCart(data, quantity))),
                      borderRadius: 5,
                      color: themeColors.downward,
                      height: 50,
                      width: double.infinity,
                      child: const Center(
                          child: Text("Add to Cart",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15)))),
                ],
              ).paddingSymmetric(
                  horizontal: StyleHelpers.horizontalPaddingnumber)
            ]);
      }));
}

Widget _partItemAddtoCart({required String title, required Widget widget}) =>
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
      widget
    ]);

GroupOrderCartModel generateDataCart(DetailProductModel data, int qty) {
  return GroupOrderCartModel(
      groupOrderCartId: data.sellerId,
      groupOrderCartName: data.sellerName,
      items: [
        OrderCartModel(
            productImage: data.imageUrl,
            productId: data.idProduct,
            productName: data.namaProduct,
            productPrice: data.hargaProduct,
            quantity: qty)
      ]);
}
