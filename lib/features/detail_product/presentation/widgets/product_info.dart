import 'package:delivery_app/core/utils/local_database/cart_model.dart';
import 'package:delivery_app/features/detail_product/bloc/detail_product_bloc.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/detail_product_widget.dart';
import 'package:delivery_app/shared/widgets/shimmer.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  final CartModel data;
  final DetailProductState state;
  final int loop;
  const ProductInfo(
      {super.key, required this.data, required this.state, required this.loop});

  @override
  Widget build(BuildContext context) {
    if (state is DetailProductLoading) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(data.productName,
                maxLines: 2,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            const SizedBox(height: 7),
            const CustomShimmer(width: 150, height: 24),
            const SizedBox(height: 7),
            CustomShimmer(width: context.fullWidth, height: 24),
            const SizedBox(height: 7),
            const Row(children: [
              CustomShimmer(width: 100, height: 25),
              SizedBox(width: 15),
              CustomShimmer(width: 100, height: 25),
              Spacer(),
              CustomShimmer(width: 80, height: 25)
            ]),
            const SizedBox(height: 10),
            const Text("Description",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            CustomShimmer(
                width: context.fullWidth, height: context.fullHeight * 0.4)
          ]);
    } else if (state is DetailProductLoaded) {
      final detailProduct = (state as DetailProductLoaded).detailproduct;
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(data.productName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            const SizedBox(height: 7),
            sellerNameWidget(context, detailProduct.sellerName),
            const SizedBox(height: 7),
            locationWidget(detailProduct.location, context),
            const SizedBox(height: 7),
            Row(children: [
              ratingWidget(context, rating: detailProduct.rating),
              const SizedBox(width: 15),
              soldWidget(context, sold: detailProduct.jumTerjual),
              const Spacer(),
              estimationTimeWidget(context, time: 45)
            ]),
            const SizedBox(height: 7),
            const Text("Description",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            const SizedBox(height: 5),
            for (int i = 0; i < loop; i++)
              Text("DATA : $i Product ini sangat enak sekali dan juga bergizi sekali kamu harus mencobanya")
                  .marginOnly(bottom: 5)
          ]);
    } else if (state is DetailProductError) {
      return Text('Error: ${(state as DetailProductError).error}').center;
    } else {
      return const SizedBox.shrink();
    }
  }
}
