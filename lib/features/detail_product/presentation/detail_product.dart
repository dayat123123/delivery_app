import 'package:delivery_app/core/utils/local_database/cart_model.dart';
import 'package:delivery_app/features/detail_product/presentation/widgets/order_floating.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/features/bottomsheet/save_product/presentation/widgets/bottomsheet_favorit.dart';
import 'package:delivery_app/shared/widgets/button.dart';
import 'package:delivery_app/shared/widgets/card_container.dart';
import 'package:delivery_app/shared/widgets/network_image.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:flutter/material.dart';

class DetailProductPage extends StatefulWidget {
  final CartModel data;
  const DetailProductPage({super.key, required this.data});

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  late TextEditingController _groupcartNameController;
  @override
  void initState() {
    _groupcartNameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: EdgeInsets.zero,
      body: SizedBox(
          width: context.fullWidth,
          height: context.fullHeight,
          child: Stack(children: [
            CustomNetworkImage(
                width: context.fullWidth,
                height: context.fullHeight * 0.4,
                networkImgUrl: widget.data.productImage),
            const Positioned(
                left: StyleHelpers.leftrightPadding,
                top: 50,
                child: CustomButton(buttonType: ButtonType.arrowbackbutton)),
            Positioned(
                right: StyleHelpers.leftrightPadding,
                top: 50,
                child: Builder(builder: (context) {
                  return CustomButton(
                      buttonType: ButtonType.savebutton,
                      onPressed: () => showBottomSheetSaveProduct(
                          context, widget.data,
                          controller: _groupcartNameController));
                })),
            Positioned(
                bottom: 0,
                child: Container(
                    padding: StyleHelpers.allPadding,
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
                        borderRadius: StyleHelpers.topRadius,
                        color: context.themeColors.appContainerBackground),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(widget.data.productName,
                              maxLines: 3,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 10),
                          Row(children: [
                            Icon(
                              Icons.star,
                              color: context.themeColors.neutral,
                            ).spaceH(before: false, after: true),
                            const Text("500(100)",
                                style: TextStyle(fontSize: 15)),
                            const Spacer(),
                            CardContainer(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                height: 25,
                                color: context.themeColors.neutral,
                                child: Row(children: [
                                  const Icon(Icons.timer, size: 20)
                                      .spaceH(before: false, spacing: 3),
                                  const Text("45 Min",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500))
                                ]))
                          ]),
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
                              ]))
                        ])))
          ])),
      bottomNavigationBar: OrderFloating(
        onPressed: () {
          context.showCustomSnackbar(
              description: "Ini ProductId : ${widget.data.productId}");
        },
      ),
    );
  }
}
