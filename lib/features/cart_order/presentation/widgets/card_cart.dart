import 'package:delivery_app/core/utils/local_database/group_order_cart_model.dart';
import 'package:delivery_app/core/utils/local_database/order_cart_model.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/misc/formatter.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:delivery_app/shared/widgets/button.dart';
import 'package:delivery_app/shared/widgets/card_container.dart';
import 'package:delivery_app/shared/widgets/checkbox_listtile.dart';
import 'package:delivery_app/shared/widgets/dropdown_button.dart';
import 'package:delivery_app/shared/widgets/network_image.dart';
import 'package:delivery_app/shared/widgets/product_widgets.dart';
import 'package:flutter/material.dart';

class CardCart extends StatefulWidget {
  final GroupOrderCartModel data;
  final void Function(OrderCartModel)? onUpdateItems;
  final void Function()? onPressedDelete;
  final void Function(GroupOrderCartModel)? onPressedCheckout;
  final void Function(OrderCartModel)? onDeleteItemFromCart;

  const CardCart(
      {super.key,
      required this.data,
      this.onPressedDelete,
      this.onDeleteItemFromCart,
      this.onPressedCheckout,
      this.onUpdateItems});

  @override
  State<CardCart> createState() => _CardCartState();
}

class _CardCartState extends State<CardCart> {
  late List<bool> _listBoolItem;
  late List<OrderCartModel> _listItems;
  bool isCheck = false;

  @override
  void initState() {
    super.initState();
    _listItems = List.from(widget.data.items ?? []);
    _listBoolItem = List.generate((_listItems.length), (index) => false);
  }

  @override
  void didUpdateWidget(CardCart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data.hasChanged(widget.data)) {
      setState(() {
        isCheck = false;
        _listItems = List.from(widget.data.items ?? []);
        _listBoolItem = List.generate((_listItems.length), (index) => false);
      });
    }
  }

  void _setAll(bool status) {
    setState(() {
      _listBoolItem = List.generate((_listItems.length), (index) => status);
      isCheck = status;
    });
  }

  bool _areAllItemsChecked() {
    return _listBoolItem.every((item) => item);
  }

  void _updateGroupCheckboxState() {
    setState(() {
      isCheck = _areAllItemsChecked();
    });
  }

  GroupOrderCartModel _dataCheckout() {
    return widget.data.copyWith(items: _itemCheck());
  }

  List<OrderCartModel> _itemCheck() {
    List<OrderCartModel> checkedItems = [];
    for (int i = 0; i < _listBoolItem.length; i++) {
      if (_listBoolItem[i]) {
        checkedItems.add(_listItems[i]);
      }
    }
    return checkedItems;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CardContainer(
        padding: StyleHelpers.allPadding,
        alignment: Alignment.topLeft,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Checkbox(
                    value: isCheck,
                    onChanged: (value) {
                      _setAll(value ?? false);
                    }),
                const SizedBox(width: 10),
                Expanded(
                    child: sellerNameWidget(
                        size: 20,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                        context,
                        widget.data.groupOrderCartName,
                        widget.data.groupOrderCartId)),
                CustomDropDownButton(
                    constraints: const BoxConstraints.tightFor(height: 120),
                    popupmenuitem: [
                      PopupMenuItemCustom(
                          onTap: () =>
                              widget.onPressedCheckout?.call(_dataCheckout()),
                          widget: const Text("Checkout",
                                  style: TextStyle(fontWeight: FontWeight.w400))
                              .center),
                      PopupMenuItemCustom(
                          onTap: widget.onPressedDelete,
                          widget: const Text("Delete",
                                  style: TextStyle(fontWeight: FontWeight.w400))
                              .center)
                    ],
                    child: CustomButton(
                        fontsize: 15,
                        widgetChild: Text("Action",
                            style: TextStyle(
                                color: context.theme.primaryColor,
                                fontWeight: FontWeight.w500)),
                        buttonType: ButtonType.buttonWithTextAndIcon))
              ]),
              if (_listItems.isNotEmpty)
                ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var data = _listItems[index];
                      return _widgetCardItemInGroup(data,
                          valueChekcbox: _listBoolItem[index], onLongPress: () {
                        if (widget.onDeleteItemFromCart != null) {
                          widget.onDeleteItemFromCart!(data);
                        }
                      }, onChangedCheckBox: (p0) {
                        setState(() {
                          _listBoolItem[index] = p0 ?? false;
                          _updateGroupCheckboxState();
                        });
                      }, onChangedIncDecrButton: (p0) {
                        setState(() {
                          OrderCartModel updatedData =
                              _listItems[index].copyWith(quantity: p0);
                          _listItems[index] = updatedData;
                          if (widget.onUpdateItems != null) {
                            widget.onUpdateItems!(updatedData);
                          }
                          if (p0 == 0 && widget.onDeleteItemFromCart != null) {
                            widget.onDeleteItemFromCart!(data);
                          }
                        });
                      });
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: _listItems.length)
            ]));
  }

  Widget _widgetCardItemInGroup(OrderCartModel data,
      {required bool valueChekcbox,
      void Function(bool?)? onChangedCheckBox,
      void Function()? onLongPress,
      void Function(int)? onChangedIncDecrButton}) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: CustomCheckboxListtile(
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          value: valueChekcbox,
          onChanged: onChangedCheckBox,
          titleChild: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomNetworkImage(
                    width: 90,
                    height: 90,
                    borderRadius: 5,
                    networkImgUrl: data.productImage),
                const SizedBox(width: 10),
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(data.productName),
                      Row(children: [
                        Text(Formatter.formatPrice(data.productPrice),
                            style: const TextStyle(fontSize: 15)),
                        const Spacer(),
                        CustomButton(
                            key: ValueKey(data.quantity),
                            initialValue: data.quantity,
                            onChangedIncDecrButton: onChangedIncDecrButton,
                            buttonType: ButtonType.incrementAndDecrementButton)
                      ])
                    ]))
              ])),
    );
  }
}
