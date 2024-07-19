import 'package:delivery_app/core/utils/local_database/cart_model.dart';
import 'package:delivery_app/features/detail_product/bloc/detail_product_bloc.dart';
import 'package:delivery_app/features/detail_product/bloc/detail_product_event.dart';
import 'package:delivery_app/features/detail_product/domain/usecases/get_product_detail/get_product_detail.dart';
import 'package:delivery_app/features/detail_product/presentation/widgets/order_floating.dart';
import 'package:delivery_app/injector.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/features/save_and_remove_favorit/presentation/widgets/bottomsheet_favorit.dart';
import 'package:delivery_app/shared/widgets/button.dart';
import 'package:delivery_app/shared/widgets/card_container.dart';
import 'package:delivery_app/shared/widgets/network_image.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailProductPage extends StatefulWidget {
  final CartModel data;
  const DetailProductPage({super.key, required this.data});

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  late DetailProductBloc _detailProductBloc;

  @override
  void initState() {
    super.initState();
    _detailProductBloc =
        DetailProductBloc(getProductDetail: inject.get<GetProductDetail>())
          ..add(LoadDetailProduct(widget.data.productId));
  }

  @override
  void dispose() {
    _detailProductBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: EdgeInsets.zero,
      body: BlocProvider(
        create: (context) => _detailProductBloc,
        child: BlocBuilder<DetailProductBloc, DetailProductState>(
          builder: (context, state) {
            return SizedBox(
                width: context.fullWidth,
                height: context.fullHeight,
                child: Stack(children: [
                  CustomNetworkImage(
                      width: context.fullWidth,
                      height: context.fullHeight * 0.34,
                      networkImgUrl: widget.data.productImage),
                  Positioned(
                      left: StyleHelpers.leftrightPadding,
                      top: 50,
                      right: StyleHelpers.leftrightPadding,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomButton(
                                buttonType: ButtonType.arrowbackbutton),
                            CustomButton(
                                buttonType: ButtonType.savebutton,
                                onPressed: () => showBottomSheetSaveProduct(
                                    context, widget.data))
                          ])),
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
                                    color: context
                                        .themeColors.appContainerShadow
                                        .withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(2, -2))
                              ],
                              borderRadius: StyleHelpers.topRadius,
                              color:
                                  context.themeColors.appContainerBackground),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(widget.data.productName,
                                    maxLines: 3,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
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
                ]));
          },
        ),
      ),
      bottomNavigationBar: OrderFloating(
        onPressed: () {
          context.showCustomSnackbar(
              description: "Ini ProductId : ${widget.data.productId}");
        },
      ),
    );
  }
}
