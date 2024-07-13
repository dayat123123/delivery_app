import 'package:delivery_app/features/category/presentation/widgets/avatar_category.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/misc/default_values.dart';
import 'package:delivery_app/shared/misc/spacer.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: DefaultValues.listcategoryModel.length,
        scrollDirection: Axis.horizontal,
        padding: SpacerHelper.horizontalPadding,
        itemBuilder: (context, index) {
          return AvatarCategory(
                  categoryModel: DefaultValues.listcategoryModel[index])
              .spaceH(before: false, after: true, spacing: 20);
        });
  }
}
