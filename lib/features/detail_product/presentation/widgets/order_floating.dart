import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/widgets/button.dart';

import 'package:flutter/material.dart';

class OrderFloating extends StatelessWidget {
  final void Function()? onPressed;
  const OrderFloating({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25).copyWith(bottom: 10),
      height: 85,
      alignment: Alignment.center,
      width: context.fullWidth,
      decoration: BoxDecoration(
        color: context.themeColors.appContainerBackground,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Rp. 150.000",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          CustomButton(
              height: 45,
              width: context.fullWidth * 0.35,
              text: "Add to cart",
              onPressed: onPressed)
        ],
      ),
    );
  }
}
