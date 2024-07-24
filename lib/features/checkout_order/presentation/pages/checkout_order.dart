import 'package:delivery_app/core/utils/local_database/group_order_cart_model.dart';
import 'package:delivery_app/core/utils/local_database/order_cart_model.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class CheckoutOrder extends StatefulWidget {
  final GroupOrderCartModel data;
  const CheckoutOrder({super.key, required this.data});

  @override
  State<CheckoutOrder> createState() => _CheckoutOrderState();
}

class _CheckoutOrderState extends State<CheckoutOrder> {
  late List<OrderCartModel> _listItems;
  @override
  void initState() {
    _listItems = List.from(widget.data.items ?? []);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: EdgeInsets.zero,
      margin: StyleHelpers.topMarginScaffold,
      appbar: AppBar(
        title: Text("Checkout ${_listItems.length}"),
      ),
    );
  }
}
