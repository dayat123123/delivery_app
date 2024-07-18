import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/misc/default_values.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:delivery_app/shared/widgets/search_textfield.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:flutter/material.dart';

class DetailCategory extends StatefulWidget {
  final String category;
  const DetailCategory({super.key, required this.category});

  @override
  State<DetailCategory> createState() => _DetailCategoryState();
}

class _DetailCategoryState extends State<DetailCategory> {
  late final TextEditingController _searchController;
  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        margin: StyleHelpers.verticalPadding,
        padding: EdgeInsets.zero,
        appbar: AppBar(title: Text(widget.category)),
        body: ListView(children: [
          SearchTextField(
            autofocus: true,
            hintText: hintText(),
          ).marginSymmetric(horizontal: StyleHelpers.horizontalPaddingnumber),
          const SizedBox(height: 20),
        ]));
  }

  String hintText() {
    switch (widget.category) {
      case DefaultValues.all:
        return "What do you want to search?";
      case DefaultValues.food:
        return "What do you want to eat?";
      case DefaultValues.drink:
        return "What do you want to drink?";
      case DefaultValues.property:
        return "What do you want to search?";
      case DefaultValues.service:
        return "What do you want to need?";
      default:
        return "";
    }
  }
}
