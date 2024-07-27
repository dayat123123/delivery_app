import 'package:delivery_app/features/detail_toko/domain/entities/product_toko_model.dart';
import 'package:delivery_app/features/detail_toko/presentation/widgets/detail_toko_widgets.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class AllProductToko extends StatelessWidget {
  final List<ProductTokoModel> data;
  final bool isLoading;
  const AllProductToko({super.key, required this.data, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.85,
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) =>
                  cardProductDetailTokoIsLoading(context))
          .marginSymmetric(horizontal: 5, vertical: 1);
    }
    return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.85,
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) =>
                cardProductDetailToko(data[index], context))
        .marginSymmetric(horizontal: 8, vertical: 5);
  }
}
