import 'package:delivery_app/features/search/presentation/widgets/history_search.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:delivery_app/shared/widgets/search_textfield.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      margin: StyleHelpers.topMarginScaffold,
      padding: EdgeInsets.zero,
      appbar: AppBar(title: const Text('Search')),
      body: ListView(
        children: [
          const SearchTextField(autofocus: true).marginSymmetric(
              horizontal: StyleHelpers.horizontalPaddingnumber),
          const SizedBox(height: 20),
          const Text('Your history search',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500))
              .centerLeft
              .marginSymmetric(
                  horizontal: StyleHelpers.horizontalPaddingnumber),
          const SizedBox(height: 15),
          const HistorySearch(),
        ],
      ),
    );
  }
}
