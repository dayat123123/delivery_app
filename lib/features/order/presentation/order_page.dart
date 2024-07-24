import 'package:delivery_app/features/cart_order/bloc/cart_order_bloc.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/misc/app_pages.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:delivery_app/shared/widgets/button.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        margin: StyleHelpers.topMarginScaffold,
        appbar: AppBar(title: const Text('Order'), actions: [
          BlocBuilder<CartOrderBloc, CartOrderState>(
            builder: (context, state) {
              if (state is CartOrderLoaded) {
                return CustomButton(
                    text: state.lengthProductGroup.toString(),
                    buttonType: ButtonType.cartButton,
                    onPressed: () =>
                        context.pushNamed(RouteNames.cartorderpage));
              }
              return CustomButton(
                  text: "0",
                  buttonType: ButtonType.cartButton,
                  onPressed: () => context.pushNamed(RouteNames.cartorderpage));
            },
          ).marginOnly(right: StyleHelpers.horizontalPaddingnumber)
        ]));
  }
}
