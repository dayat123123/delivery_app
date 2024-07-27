import 'package:delivery_app/features/wishlish/domain/entities/cart_model.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class OrderFloating extends StatelessWidget {
  final void Function()? onTapChat;
  final void Function()? onTapCart;
  final void Function()? onTapBuy;
  final CartModel data;
  const OrderFloating(
      {super.key,
      this.onTapChat,
      required this.data,
      this.onTapCart,
      this.onTapBuy});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 20),
        height: 75,
        width: context.fullWidth,
        decoration: BoxDecoration(
            color: context.themeColors.appContainerBackground,
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  color:
                      context.themeColors.appContainerShadow.withOpacity(0.1),
                  blurRadius: 1,
                  offset: const Offset(1, -1))
            ]),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: onTapChat,
                  child: Container(
                      color: context.themeColors.appContainerBackground,
                      height: context.fullHeight,
                      width: context.fullWidth * 0.25,
                      child: const Icon(Icons.chat))),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: VerticalDivider(
                      thickness: 1,
                      color: context.themeColors.appContainerShadow)),
              GestureDetector(
                  onTap: onTapCart,
                  child: Container(
                      color: context.themeColors.appContainerBackground,
                      height: context.fullHeight,
                      width: context.fullWidth * 0.25,
                      child: const Icon(Icons.add_shopping_cart))),
              Expanded(
                  flex: 4,
                  child: GestureDetector(
                      onTap: onTapBuy,
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: context.themeColors.downward),
                          child: const Text("BUY NOW",
                              style: TextStyle(fontWeight: FontWeight.w500)))))
            ]));
  }
}
