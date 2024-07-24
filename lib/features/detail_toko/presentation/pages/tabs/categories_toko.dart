import 'package:delivery_app/features/detail_toko/domain/entities/categories_toko_model.dart';
import 'package:delivery_app/features/detail_toko/presentation/widgets/detail_toko_widgets.dart';
import 'package:flutter/material.dart';

class CategoriesToko extends StatelessWidget {
  final List<CategoriesTokoModel> data;
  final bool isLoading;
  const CategoriesToko({super.key, required this.data, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(height: 1),
          padding: const EdgeInsets.only(top: 5),
          itemBuilder: (context, index) =>
              cardCategoriesDetailTokoIsloading(context),
          itemCount: 1);
    }
    return ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 5),
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(height: 5),
        itemBuilder: (context, index) =>
            cardCategoriesDetailToko(data[index], context),
        itemCount: data.length);
  }
}
