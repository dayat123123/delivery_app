import 'package:delivery_app/features/category/domain/entities/category_model.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/misc/params_keys.dart';
import 'package:delivery_app/shared/misc/file_paths.dart';
import 'package:delivery_app/shared/misc/app_pages.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:delivery_app/shared/widgets/card_container.dart';
import 'package:delivery_app/shared/widgets/network_image.dart';
import 'package:flutter/material.dart';

class AvatarCategory extends StatelessWidget {
  final CategoryModel categoryModel;
  const AvatarCategory({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
        onTap: () => context.pushNamed(RouteNames.detailcategory,
            arguments: {ParamsKeys.title: categoryModel.title}),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: CustomNetworkImage(
                      width: 110,
                      sourceImageFrom: CustomNetworkImageSource.asset,
                      borderRadius: StyleHelpers.borderRadius,
                      assetImgUrl: categoryModel.imageUrl ?? FilePaths.alljpg)),
              const SizedBox(height: 10),
              Text(categoryModel.title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              const SizedBox(height: 5),
            ]));
  }
}
