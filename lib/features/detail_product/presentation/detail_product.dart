import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/detail_product/data/repositories/product_repositories_impl.dart';
import 'package:delivery_app/features/detail_product/domain/entities/product_model.dart';
import 'package:delivery_app/features/detail_product/domain/usecases/get_product_detail/get_product_detail.dart';
import 'package:delivery_app/features/detail_product/presentation/widgets/order_floating.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/misc/file_paths.dart';
import 'package:delivery_app/shared/widgets/card_container.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:delivery_app/shared/misc/spacer_helpers.dart';
import 'package:flutter/material.dart';

class DetailProductPage extends StatefulWidget {
  final String idProduct;
  const DetailProductPage({super.key, required this.idProduct});

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  late Future<Result<DetailProductModel>> future;
  @override
  void initState() {
    future =
        GetProductDetail(networkProductRepositories: ProductRepositoriesImpl())
            .call(widget.idProduct);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: EdgeInsets.zero,
      body: SizedBox(
        width: context.fullWidth,
        height: context.fullHeight,
        child: Stack(
          children: [
            Container(
                width: context.fullWidth,
                height: context.fullHeight * 0.4,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        fit: BoxFit.fill,
                        image: AssetImage(FilePaths.foodjpg)))),
            Positioned(
                left: SpacerHelper.leftrightPadding,
                top: 50,
                child: CardContainer(
                    shape: CardContainerShape.circle,
                    width: 45,
                    height: 45,
                    onTap: () => context.pop(),
                    child: const Icon(Icons.arrow_back_ios_new))),
            Positioned(
                right: SpacerHelper.leftrightPadding,
                top: 50,
                child: CardContainer(
                    shape: CardContainerShape.circle,
                    width: 45,
                    height: 45,
                    onTap: () => context.showCustomSnackbar(
                        type: DialogAccentType.info,
                        description: "Favorite euy"),
                    child: const Icon(Icons.favorite_border))),
            Positioned(
              bottom: 0,
              child: Container(
                padding: SpacerHelper.allPadding,
                width: context.fullWidth,
                height: context.fullHeight * 0.6,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          color: context.themeColors.appContainerShadow
                              .withOpacity(0.15),
                          blurRadius: 4,
                          blurStyle: BlurStyle.normal,
                          offset: const Offset(2, -5))
                    ],
                    borderRadius: SpacerHelper.topRadius,
                    color: context.themeColors.appContainerBackground),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Roasted Salmond With Salted Egg Chicken",
                        maxLines: 3,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: context.themeColors.neutral,
                        ).spaceH(before: false, after: true),
                        const Text("500(100)", style: TextStyle(fontSize: 15)),
                        const Spacer(),
                        CardContainer(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            height: 25,
                            color: context.themeColors.neutral,
                            child: Row(
                              children: [
                                const Icon(Icons.timer, size: 20)
                                    .spaceH(before: false, spacing: 3),
                                const Text("45 Min",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500))
                              ],
                            ))
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text("Description",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    Expanded(
                        child: ListView(
                      padding: const EdgeInsets.only(top: 5),
                      children: [
                        const SizedBox(height: 5),
                        for (int i = 0; i < 10; i++)
                          const Text(
                                  "Menu ini dibuat dengan campuran udang ebi khas dari makasar dan juga udah tempura khas dari Riau, menjadikan menu ini cocok untuk dimakan kapan saja",
                                  style: TextStyle(fontSize: 15))
                              .spaceV(before: false),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: OrderFloating(
        onPressed: () {
          print(widget.idProduct);
          context.showCustomSnackbar(description: "Ini button add to cart");
        },
      ),
    );
  }
}

List<Widget> dd = [
  Container(
    margin: const EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(SpacerHelper.borderRadius),
      image: const DecorationImage(
          fit: BoxFit.fill, image: AssetImage(FilePaths.alljpg)),
    ),
  ),
  Container(
    margin: const EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(SpacerHelper.borderRadius),
      image: const DecorationImage(
          fit: BoxFit.fill, image: AssetImage(FilePaths.foodjpg)),
    ),
  ),
];

// import 'package:delivery_app/core/entities/result.dart';
// import 'package:delivery_app/features/detail_product/data/repositories/product_repositories_impl.dart';
// import 'package:delivery_app/features/detail_product/domain/entities/product_model.dart';
// import 'package:delivery_app/features/detail_product/domain/usecases/get_product_detail/get_product_detail.dart';
// import 'package:delivery_app/features/detail_product/presentation/widgets/order_floating.dart';
// import 'package:delivery_app/shared/extensions/context_extensions.dart';
// import 'package:delivery_app/shared/extensions/widget_extensions.dart';
// import 'package:delivery_app/shared/misc/FilePaths.dart';
// import 'package:delivery_app/shared/widgets/carousel.dart';
// import 'package:delivery_app/shared/widgets/scaffold.dart';
// import 'package:delivery_app/shared/widgets/spacer.dart';
// import 'package:flutter/material.dart';

// class DetailProductPage extends StatefulWidget {
//   final String idProduct;
//   const DetailProductPage({super.key, required this.idProduct});

//   @override
//   State<DetailProductPage> createState() => _DetailProductPageState();
// }

// class _DetailProductPageState extends State<DetailProductPage> {
//   late Future<Result<DetailProductModel>> future;
//   @override
//   void initState() {
//     future =
//         GetProductDetail(networkProductRepositories: ProductRepositoriesImpl())
//             .call(widget.idProduct);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(
//       padding: EdgeInsets.zero,
//       appbar: AppBar(
//         title: const Text('Detail Item'),
//         actions: [const Icon(Icons.favorite).marginOnly(right: 15)],
//       ),
//       bottomNavigationBar: OrderFloating(
//         onPressed: () {
//           print(widget.idProduct);
//           context.showCustomSnackbar(description: "Ini button add to cart");
//         },
//       ),
//       body: ListView(
//         children: [
//           const SizedBox(height: 15),
//           Text(
//             "Spicy Chicken Wing",
//             style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
//           ).centerLeft.marginSymmetric(
//               horizontal: SpacerHelper.horizontalPaddingnumber),
//           SizedBox(height: 5),
//           Text(
//             "Subtile nya ada disini",
//             style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
//           ).centerLeft.marginSymmetric(
//               horizontal: SpacerHelper.horizontalPaddingnumber),
//           SizedBox(height: 5),
//           SizedBox(
//             height: 230,
//             width: context.fullWidth,
//             child: CustomCarousel(
//               listwidget: dd,
//               positionedIndicatorBottom: 15,
//             ),
//           ),
//           SizedBox(height: 10),
//           for (int i = 0; i < 10; i++)
//             Container(
//               margin: EdgeInsets.only(top: 10),
//               height: 250,
//               width: context.fullWidth,
//               decoration: BoxDecoration(color: Colors.red),
//             ).marginSymmetric(horizontal: SpacerHelper.horizontalPaddingnumber),
//         ],
//       ),
//     );
//   }
// }

// List<Widget> dd = [
//   Container(
//     margin: EdgeInsets.only(top: 10),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(SpacerHelper.borderRadius),
//       image:
//           DecorationImage(fit: BoxFit.fill, image: AssetImage(FilePaths.alljpg)),
//     ),
//   ),
//   Container(
//     margin: EdgeInsets.only(top: 10),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(SpacerHelper.borderRadius),
//       image: DecorationImage(
//           fit: BoxFit.fill, image: AssetImage(FilePaths.foodjpg)),
//     ),
//   ),
// ];
