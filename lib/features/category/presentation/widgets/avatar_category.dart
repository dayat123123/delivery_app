import 'package:delivery_app/features/category/domain/entities/category_model.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/misc/params_key.dart';
import 'package:delivery_app/shared/misc/pathfile.dart';
import 'package:delivery_app/shared/misc/route_names.dart';
import 'package:flutter/material.dart';

class AvatarCategory extends StatelessWidget {
  final CategoryModel categoryModel;
  const AvatarCategory({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => context.pushNamed(RouteNames.detailcategory,
            arguments: {ParamsKey.title: categoryModel.title}),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: CircleAvatar(
                      backgroundImage:
                          AssetImage(categoryModel.imageUrl ?? PathFile.alljpg),
                      radius: 38)),
              const SizedBox(height: 5),
              Text(categoryModel.title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500))
            ]));
  }
}
