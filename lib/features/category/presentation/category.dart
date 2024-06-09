import 'package:delivery_app/features/category/domain/entities/category_model.dart';
import 'package:delivery_app/features/category/presentation/widgets/avatar_category.dart';
import 'package:delivery_app/shared/misc/pathfile.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/spacer.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listcategoryModel.length,
        scrollDirection: Axis.horizontal,
        padding: SpacerHelper.horizontalPadding,
        itemBuilder: (context, index) {
          return AvatarCategory(categoryModel: listcategoryModel[index])
              .spaceH(before: false, after: true, spacing: 20);
        });
  }
}

List<CategoryModel> listcategoryModel = [
  const CategoryModel(title: 'All', imageUrl: PathFile.alljpg),
  const CategoryModel(title: 'Food', imageUrl: PathFile.foodjpg),
  const CategoryModel(title: 'Drink', imageUrl: PathFile.drinkjpg),
  const CategoryModel(title: 'Property', imageUrl: PathFile.property),
  const CategoryModel(title: 'Service', imageUrl: PathFile.servicejpg)
];
