import 'package:delivery_app/features/favorit/domain/entities/cart_model.dart';
import 'package:delivery_app/features/detail_product/presentation/bloc/detail_product_bloc.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/misc/app_pages.dart';
import 'package:delivery_app/shared/misc/formatter.dart';
import 'package:delivery_app/shared/misc/params_keys.dart';
import 'package:delivery_app/shared/widgets/button.dart';
import 'package:delivery_app/shared/widgets/product_widgets.dart';
import 'package:delivery_app/shared/widgets/shimmer.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  final CartModel data;
  final DetailProductState state;
  final int loop;
  const ProductInfo(
      {super.key, required this.data, required this.state, required this.loop});

  @override
  Widget build(BuildContext context) {
    if (state is DetailProductLoading) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(data.productName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500))),
                  const SizedBox(width: 15),
                  const CustomShimmer(width: 120, height: 25)
                ]),
            const SizedBox(height: 7),
            const CustomShimmer(width: 150, height: 24),
            const SizedBox(height: 7),
            CustomShimmer(width: context.fullWidth, height: 24),
            const SizedBox(height: 7),
            const Row(children: [
              CustomShimmer(width: 100, height: 25),
              SizedBox(width: 15),
              CustomShimmer(width: 100, height: 25),
              Spacer(),
              CustomShimmer(width: 80, height: 25)
            ]),
            const SizedBox(height: 10),
            const Text("Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            CustomShimmer(
                width: context.fullWidth, height: context.fullHeight * 0.2),
            const Text("Comments",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            CustomShimmer(
                width: context.fullWidth, height: context.fullHeight * 0.2),
          ]);
    } else if (state is DetailProductLoaded) {
      final detailProduct = (state as DetailProductLoaded).detailproduct;
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(detailProduct.namaProduct,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                ),
                const SizedBox(width: 15),
                Text(Formatter.formatPrice(detailProduct.hargaProduct),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.w500))
              ],
            ),
            const SizedBox(height: 7),
            sellerNameWidget(
                context, detailProduct.sellerName, detailProduct.sellerId),
            const SizedBox(height: 7),
            locationWidget(detailProduct.location, context),
            const SizedBox(height: 7),
            Row(children: [
              ratingWidget(context,
                  rating: detailProduct.rating,
                  totalReviewers: detailProduct.totalReviewers),
              const SizedBox(width: 15),
              soldWidget(context, sold: detailProduct.jumTerjual),
              const Spacer(),
              estimationTimeWidget(context, time: detailProduct.estimationTime)
            ]),
            const SizedBox(height: 7),
            const Text("Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 5),
            const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?")
                .marginOnly(bottom: 5),
            Row(children: [
              const Text("Comments",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              const Spacer(),
              CustomButton(
                  onPressed: () => context
                          .pushNamed(RouteNames.showmorecomments, arguments: {
                        ParamsKeys.idProduct: detailProduct.idProduct,
                        ParamsKeys.sellerIdKey: detailProduct.sellerId
                      }),
                  buttonType: ButtonType.textbutton,
                  text: "Show more")
            ]),
            commentWidget(context,
                listComments: detailProduct.listComments ?? [])
          ]).marginOnly(bottom: 80);
    } else if (state is DetailProductError) {
      return Text('Error: ${(state as DetailProductError).error}').center;
    } else {
      return const SizedBox.shrink();
    }
  }
}
