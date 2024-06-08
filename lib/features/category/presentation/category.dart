import 'package:delivery_app/shared/misc/params_key.dart';
import 'package:delivery_app/shared/misc/pathfile.dart';
import 'package:delivery_app/shared/misc/route_names.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/spacer.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: SpacerHelper.horizontalPadding,
        scrollDirection: Axis.horizontal,
        children: List.generate(
            listcategoryModel.length,
            (index) => GestureDetector(
                  onTap: () => context.pushNamed(RouteNames.detailcategory,
                      arguments: {
                        ParamsKey.title: listcategoryModel[index].title
                      }),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    listcategoryModel[index].imageUrl ??
                                        PathFile.alljpg),
                                radius: 38)),
                        const SizedBox(height: 5),
                        Text(listcategoryModel[index].title,
                            style: context.textTheme.labelLarge
                                ?.copyWith(fontSize: 16))
                      ]),
                ).spaceH(before: false, after: true, spacing: 20)));
  }
}

List<CategoryModel> listcategoryModel = [
  CategoryModel(title: 'All', imageUrl: PathFile.alljpg),
  CategoryModel(title: 'Food', imageUrl: PathFile.foodjpg),
  CategoryModel(title: 'Drink', imageUrl: PathFile.drinkjpg),
  CategoryModel(title: 'Property', imageUrl: PathFile.property),
  CategoryModel(title: 'Service', imageUrl: PathFile.servicejpg)
];

class CategoryModel {
  final String title;
  final String? imageUrl;
  CategoryModel({required this.title, this.imageUrl});
}
