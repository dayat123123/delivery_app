import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/misc/spacer.dart';
import 'package:flutter/material.dart';

class HistorySearch extends StatelessWidget {
  const HistorySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: double.infinity,
      child: ListView(
        padding: SpacerHelper.horizontalPadding,
        scrollDirection: Axis.horizontal,
        children: List.generate(
          10,
          (index) {
            return Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: context.themeColors.appContainerBackground,
                        border: Border.all(
                            width: 1, color: context.theme.primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text('Ayam Bakar $index'))
                .marginOnly(right: 5);
          },
        ),
      ),
    );
  }
}
