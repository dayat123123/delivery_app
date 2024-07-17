import 'package:delivery_app/core/utils/local_database/cart_model.dart';
import 'package:delivery_app/shared/extensions/theme_extensions/theme.dart';
import 'package:delivery_app/shared/widgets/card_container.dart';
import 'package:delivery_app/shared/widgets/network_image.dart';
import 'package:flutter/material.dart';

class CardDetailWishlish extends StatelessWidget {
  final CartModel data;
  final void Function(CartModel)? onTap;
  const CardDetailWishlish({super.key, required this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
        alignment: Alignment.topCenter,
        onTap: () => onTap?.call(data),
        borderRadius: 0,
        child: Stack(children: [
          CustomNetworkImage(
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              networkImgUrl: data.productImage),
          Positioned(
              bottom: 5,
              left: 5,
              right: 0,
              child: Text(data.productName.isEmpty ? "..." : data.productName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: AppColors.white)))
        ]));
  }
}
