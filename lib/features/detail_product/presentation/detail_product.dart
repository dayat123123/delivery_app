import 'package:delivery_app/core/utils/local_database/cart_model.dart';
import 'package:delivery_app/features/detail_product/bloc/detail_product_bloc.dart';
import 'package:delivery_app/features/detail_product/bloc/detail_product_event.dart';
import 'package:delivery_app/features/detail_product/domain/usecases/get_product_detail/get_product_detail.dart';
import 'package:delivery_app/features/detail_product/presentation/widgets/order_floating.dart';
import 'package:delivery_app/features/detail_product/presentation/widgets/product_info.dart';
import 'package:delivery_app/injector.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/features/save_and_remove_favorit/presentation/widgets/bottomsheet_favorit.dart';
import 'package:delivery_app/shared/widgets/button.dart';
import 'package:delivery_app/shared/widgets/network_image.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:delivery_app/shared/widgets/scrollbar.dart';
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
  late TextEditingController _controllerText;
  bool isLoading = false;
  int loop = 15;
  @override
  void initState() {
    super.initState();
    _controllerText = TextEditingController();
    _detailProductBloc =
        DetailProductBloc(getProductDetail: inject.get<GetProductDetail>())
          ..add(LoadDetailProduct(widget.data.productId));
  }

  @override
  void dispose() {
    _controllerText.dispose();
    _detailProductBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appbar: AppBar(
            leading: CustomButton(
                width: 50,
                buttonType: ButtonType.arrowbackbutton,
                onPressed: () => context.pop()).marginOnly(left: 5),
            actions: [
              CustomButton(
                  width: 50,
                  buttonType: ButtonType.savebutton,
                  onPressed: () => showBottomSheetSaveProduct(
                      controller: _controllerText,
                      context,
                      widget.data)).marginOnly(right: 5)
            ]),
        padding: EdgeInsets.zero,
        body: CustomScrollBar(
            scrollbarType: ScrollbarType.enableBoth,
            onRefresh: (p0) => _detailProductBloc
                .add(RefreshDetailProduct(widget.data.productId, p0)),
            onLoading: (p0) async {
              p0.loadComplete();
              loop += 10;
              setState(() {});
            },
            child: Column(children: [
              Stack(children: [
                CustomNetworkImage(
                    width: context.fullWidth,
                    height: context.fullHeight * 0.33,
                    networkImgUrl: widget.data.productImage),
                Positioned(
                    bottom: 0,
                    child: Container(
                        width: context.fullWidth,
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: StyleHelpers.topRadius,
                            color: context.themeColors.appContainerBackground)))
              ]),
              Container(
                  padding: StyleHelpers.horizontalPadding,
                  width: context.fullWidth,
                  color: context.themeColors.appContainerBackground,
                  child: BlocProvider(
                      create: (context) => _detailProductBloc,
                      child: BlocBuilder<DetailProductBloc, DetailProductState>(
                          bloc: _detailProductBloc,
                          builder: (context, state) => ProductInfo(
                              loop: loop, data: widget.data, state: state))))
            ])),
        bottomNavigationBar: OrderFloating(
          data: widget.data,
          onPressed: () => context.showCustomSnackbar(
              description: "Ini ProductId : ${widget.data.productId}"),
        ));
  }
}
