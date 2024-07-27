import 'package:delivery_app/features/category/presentation/widgets/avatar_category.dart';
import 'package:delivery_app/shared/misc/default_values.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) =>
            const SizedBox(width: StyleHelpers.rightMargin + 5),
        itemCount: DefaultValues.listcategoryModel.length,
        scrollDirection: Axis.horizontal,
        padding: StyleHelpers.horizontalPadding,
        itemBuilder: (context, index) => AvatarCategory(
            categoryModel: DefaultValues.listcategoryModel[index]));
  }
}
