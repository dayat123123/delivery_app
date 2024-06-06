import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appbar: AppBar(
        title: Text('Search'),
      ),
    );
  }
}
