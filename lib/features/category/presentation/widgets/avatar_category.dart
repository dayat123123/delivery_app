import 'package:delivery_app/features/category/domain/entities/category_model.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/misc/params_keys.dart';
import 'package:delivery_app/shared/misc/file_paths.dart';
import 'package:delivery_app/shared/misc/app_pages.dart';
import 'package:delivery_app/shared/widgets/network_image.dart';
import 'package:flutter/material.dart';

class AvatarCategory extends StatelessWidget {
  final CategoryModel categoryModel;
  const AvatarCategory({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => context.pushNamed(RouteNames.detailcategory,
            arguments: {ParamsKeys.title: categoryModel.title}),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: CustomNetworkImage(
                      width: 85,
                      scale: 0.85,
                      shape: CustomNetworkImageShape.circle,
                      fit: BoxFit.cover,
                      assetImgUrl: categoryModel.imageUrl ?? FilePaths.alljpg)),
              const SizedBox(height: 5),
              Text(categoryModel.title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500))
            ]));
  }
}
