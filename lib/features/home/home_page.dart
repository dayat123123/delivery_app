import 'package:delivery_app/features/category/presentation/category.dart';
import 'package:delivery_app/features/popular_now/presentation/popular.dart';
import 'package:delivery_app/features/recommended/presentation/recommended.dart';
import 'package:delivery_app/shared/misc/pathfile.dart';
import 'package:delivery_app/shared/misc/route_names.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/card.dart';
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
  final double heigthPopular = 230;
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
            const Text('Good Food,\nFast Delivery.',
                style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold, height: 1.2)),
            const SizedBox(height: 20),
            GestureDetector(
                onTap: () => context.pushNamed(RouteNames.searchpage),
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
              height: heigthPopular,
              width: double.infinity,
              child: const PopularNow(),
            ),
            const SizedBox(height: 10),
            const Text('Recommended',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            SizedBox(
                height: heigthPopular,
                width: double.infinity,
                child: const Recommended()),
            const SizedBox(height: 10),
            const Text('Big Promo',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            ...[
              for (int i = 1; i < 6; i++)
                CustomCard(
                  height: 120,
                  width: context.fullWidth,
                  child: Text('Data : $i').center,
                ).marginOnly(bottom: 10)
            ],
            const SizedBox(height: 15),
            const Text('Trending on $applicationName',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
          ],
        ).paddingSymmetric(horizontal: 15).marginOnly(top: 10),
      ),
    );
  }
}

List<String> listcategory = ["All", "Food", "Drink", "Service"];
