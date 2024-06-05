import 'package:delivery_app/shared/constans/pathfile.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final bool isCUrrent;
  final String name;
  final double height;
  const Category(
      {super.key,
      required this.isCUrrent,
      required this.name,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          width: 100,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage(PathFile.malejpg), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(5),
              shape: BoxShape.rectangle),
        ).spaceH(before: false, after: true)),
        const SizedBox(height: 5),
        Text(name, style: context.textTheme.labelLarge?.copyWith(fontSize: 16))
      ],
    );
  }
}
