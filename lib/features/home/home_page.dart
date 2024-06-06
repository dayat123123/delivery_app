import 'package:delivery_app/features/home/widgets/category.dart';
import 'package:delivery_app/features/home/widgets/popular.dart';
import 'package:delivery_app/shared/constans/route_names.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:delivery_app/shared/widgets/search_textfield.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController? _scrollController;
  final double heightCategory = 120;
  final double heigthPopluar = 230;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: EdgeInsets.zero,
      body: Scrollbar(
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          children: [
            const Text('Good Food.\nFast Delivery.',
                style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold, height: 1.2)),
            const SizedBox(height: 20),
            GestureDetector(
                onTap: () {
                  context.pushNamed(RouteNames.searchpage);
                },
                child: const SearchTextField(enabled: false)),
            const SizedBox(height: 20),
            SizedBox(
              height: heightCategory,
              width: double.infinity,
              child: const Category(),
            ),
            const SizedBox(height: 15),
            const Text('Popular Now',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            SizedBox(
              height: heigthPopluar,
              width: double.infinity,
              child: const Popular(),
            ),
            const SizedBox(height: 10),
            const Text('Recommended',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            SizedBox(
              height: heigthPopluar,
              width: double.infinity,
              child: const Popular(),
            ),
            const SizedBox(height: 10),
          ],
        ).paddingSymmetric(horizontal: 15).marginOnly(top: 10),
      ),
    );
  }
}

List<String> listcategory = ["All", "Food", "Drink", "Service"];
List<Popular> listPoluar = [for (int i = 0; i < 10; i++) const Popular()];
