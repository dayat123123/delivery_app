import 'package:delivery_app/features/detail_product/domain/entities/comment_model.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/theme_extensions/theme.dart';
import 'package:delivery_app/shared/misc/formatter.dart';
import 'package:delivery_app/shared/widgets/carousel.dart';
import 'package:delivery_app/shared/widgets/network_image.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class FocusComment extends StatelessWidget {
  final int indexImage;
  final CommentModel data;
  const FocusComment({super.key, required this.indexImage, required this.data});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appbar: AppBar(),
        padding: EdgeInsets.zero,
        body: Stack(children: [
          CustomCarousel(
              initialIndex: indexImage,
              positionedIndicatorBottom: 50,
              withPadding: false,
              listwidget: List.generate(
                  data.listFotoComments?.length ?? 0,
                  (index) => CustomNetworkImage(
                      networkImgUrl: data.listFotoComments?[index],
                      fit: BoxFit.cover,
                      width: context.fullWidth,
                      height: context.fullHeight))),
          Positioned(
              bottom: 100,
              left: 15,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        Formatter.obscureName(data.commentAccount,
                            isHide: data.isHideAccountId),
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white)),
                    Formatter.formatRating(context,
                        fontColor: AppColors.white,
                        rating: data.rating,
                        fontSize: 15),
                    Text(data.commentDesc,
                        style: const TextStyle(
                            fontSize: 14, color: AppColors.white))
                  ]))
        ]));
  }
}
