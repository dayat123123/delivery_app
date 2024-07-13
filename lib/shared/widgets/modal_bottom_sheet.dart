import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/misc/spacer_helpers.dart';
import 'package:flutter/material.dart';

class CustomModalBottomSheet extends StatelessWidget {
  final List<Widget> widget;

  const CustomModalBottomSheet({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
              decoration: BoxDecoration(
                  color: context.themeColors.appContainerBackground,
                  borderRadius: SpacerHelper.topRadius),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  itemCount: widget.length,
                  itemBuilder: (BuildContext context, int index) =>
                      widget[index]));
        });
  }
}
