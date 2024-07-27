import 'package:delivery_app/features/cart_order/domain/entities/group_order_cart_model.dart';
import 'package:delivery_app/features/cart_order/domain/entities/order_cart_model.dart';
import 'package:delivery_app/features/cart_order/presentation/bloc/cart_order_bloc.dart';
import 'package:delivery_app/features/cart_order/presentation/widgets/card_cart.dart';
import 'package:delivery_app/dependency_injection.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/misc/app_pages.dart';
import 'package:delivery_app/shared/misc/params_keys.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:delivery_app/shared/widgets/progress_indicator.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:delivery_app/shared/widgets/scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CartOrder extends StatefulWidget {
  const CartOrder({super.key});

  @override
  State<CartOrder> createState() => _CartOrderState();
}

class _CartOrderState extends State<CartOrder> {
  final _cartOrderBloc = inject.get<CartOrderBloc>();
  @override
  void initState() {
    super.initState();
  }

  _onTapDeleteGroupCart(GroupOrderCartModel data) => context.showDialogCustom(
      title: "Confirm Delete",
      content: "Are you sure want to delete\ncart ${data.groupOrderCartName}?",
      onPressed: () => _cartOrderBloc
          .add(RemoveCartOrderGroup(cartOrderGroupId: data.groupOrderCartId)));

  _onDeleteItemFromGroupCart(
          {required GroupOrderCartModel groupCartOrder,
          required OrderCartModel data}) =>
      context.showDialogCustom(
          alowDismiss: false,
          title: "Confirm Delete",
          content: "Delete item ${data.productName}?",
          onPressed: () => _cartOrderBloc.add(RemoveItemsOnCartOrderGroup(
              deleteItem: data, groupData: groupCartOrder)));

  _onUpdateItemInGroupCart(
          GroupOrderCartModel groupData, OrderCartModel newData) =>
      _cartOrderBloc.add(
          UpdateItemsInCartOrderGroup(newItem: newData, groupData: groupData));

  _onPressCheckout(GroupOrderCartModel p0) {
    final listItems = p0.items;
    if (listItems.isEmpty) {
      context.showCustomSnackbar(
          title: "Attention",
          type: DialogAccentType.warning,
          description: "Please select at least one items in cart");
    } else {
      context.pushNamed(RouteNames.checkoutorderpage,
          arguments: {ParamsKeys.checkoutdatakey: p0});
    }
  }

  _onRefresh(RefreshController controller) =>
      _cartOrderBloc.add(ReloadLoadCartOrder(controller: controller));

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: EdgeInsets.zero,
      margin: StyleHelpers.topMarginScaffold,
      appbar: AppBar(title: const Text("Cart")),
      body: CustomScrollBar(
        onRefresh: (p0) => _onRefresh(p0),
        scrollbarType: ScrollbarType.enablePulldown,
        child: BlocBuilder<CartOrderBloc, CartOrderState>(
                bloc: _cartOrderBloc,
                builder: (context, state) {
                  if (state is CartOrderLoading) {
                    return progressIndicatorWidget(context: context).center;
                  } else if (state is CartOrderLoaded) {
                    if (state.dataList.isEmpty) {
                      return const Text("Cart is empty",
                              textAlign: TextAlign.center)
                          .center;
                    }
                    return ListView.separated(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final data = state.dataList[index];
                          return CardCart(
                              key: ValueKey(data.groupOrderCartId),
                              data: data,
                              onDeleteItemFromCart: (p0) =>
                                  _onDeleteItemFromGroupCart(
                                      groupCartOrder: data, data: p0),
                              onPressedDelete: () =>
                                  _onTapDeleteGroupCart(data),
                              onPressedCheckout: (p0) => _onPressCheckout(p0),
                              onUpdateItems: (p0) =>
                                  _onUpdateItemInGroupCart(data, p0));
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 5),
                        itemCount: state.dataList.length);
                  } else if (state is CartOrderError) {
                    return Text(state.error).center;
                  }
                  return const SizedBox.shrink();
                })
            .paddingSymmetric(horizontal: StyleHelpers.horizontalPaddingnumber),
      ),
    );
  }
}
