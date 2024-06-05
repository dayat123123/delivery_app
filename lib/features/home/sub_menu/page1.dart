import 'package:delivery_app/features/home/widgets/category.dart';
import 'package:delivery_app/features/home/widgets/popular.dart';
import 'package:delivery_app/shared/constans/route_names.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/search_textfield.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
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
    return Scrollbar(
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
                context.pushNamed(RouteNames.loginpage);
              },
              child: const SearchTextField(enabled: false)),
          const SizedBox(height: 20),
          SizedBox(
            height: heightCategory,
            width: double.infinity,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    listcategory.length,
                    (index) => Category(
                        height: heightCategory,
                        isCUrrent: index == 0 ? true : false,
                        name: listcategory[index]))),
          ),
          const SizedBox(height: 15),
          const Text('Popular Now',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          SizedBox(
            height: heigthPopluar,
            width: double.infinity,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  listPoluar.length,
                  (index) => listPoluar[index],
                )),
          ),
          const SizedBox(height: 10),
          const Text('Recommended',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          SizedBox(
            height: heigthPopluar,
            width: double.infinity,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  listPoluar.length,
                  (index) => listPoluar[index],
                )),
          ),
          const SizedBox(height: 10),
        ],
      ).paddingSymmetric(horizontal: 15).marginOnly(top: 10),
    );
  }
}

List<String> listcategory = ["All", "Food", "Drink", "Service"];
List<Popular> listPoluar = [for (int i = 0; i < 10; i++) const Popular()];
