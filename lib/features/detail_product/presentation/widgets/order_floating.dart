import 'package:delivery_app/core/utils/local_database/cart_model.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/misc/formatter.dart';
import 'package:delivery_app/shared/widgets/button.dart';

import 'package:flutter/material.dart';

class OrderFloating extends StatelessWidget {
  final void Function()? onPressed;
  final CartModel data;
  const OrderFloating({super.key, this.onPressed, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25).copyWith(top: 7),
        height: 70,
        alignment: Alignment.topCenter,
        width: context.fullWidth,
        decoration: BoxDecoration(
            color: context.themeColors.appContainerBackground,
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  color:
                      context.themeColors.appContainerShadow.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(2, -2))
            ]),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(Formatter.formatPrice(data.productPrice),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500)),
              CustomButton(
                  height: 45,
                  width: context.fullWidth * 0.35,
                  text: "Add to cart",
                  onPressed: onPressed)
            ]));
  }
}
