import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/misc/default_values.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:delivery_app/shared/widgets/search_textfield.dart';
import 'package:delivery_app/shared/misc/spacer_helpers.dart';
import 'package:flutter/material.dart';

class DetailCategory extends StatefulWidget {
  final String category;
  const DetailCategory({super.key, required this.category});

  @override
  State<DetailCategory> createState() => _DetailCategoryState();
}

class _DetailCategoryState extends State<DetailCategory> {
  late final TextEditingController _textEditingController;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: EdgeInsets.zero,
      appbar: AppBar(title: Text(widget.category)),
      body: Column(
        children: [
          const SizedBox(height: 20),
          SearchTextField(
            controller: _textEditingController,
            hintText: hintText(),
          ).marginSymmetric(horizontal: SpacerHelper.horizontalPaddingnumber),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  String hintText() {
    if (widget.category == DefaultValues.all) {
      return "What do you want to search?";
    } else if (widget.category == DefaultValues.food) {
      return "What do you want to eat?";
    } else if (widget.category == DefaultValues.drink) {
      return "What do you want to drink?";
    } else if (widget.category == DefaultValues.property) {
      return "What do you want to search?";
    } else if (widget.category == DefaultValues.service) {
      return "What do you want to need?";
    } else {
      return "";
    }
  }
}
