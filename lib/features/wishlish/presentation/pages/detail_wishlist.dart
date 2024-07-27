import 'package:delivery_app/features/wishlish/domain/entities/cart_model.dart';
import 'package:delivery_app/features/wishlish/domain/entities/group_cart_model.dart';
import 'package:delivery_app/features/wishlish/presentation/widgets/card_detail_wishlish.dart';
import 'package:delivery_app/injector.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/features/wishlish/presentation/bloc/favorite_bloc.dart';
import 'package:delivery_app/shared/misc/app_pages.dart';
import 'package:delivery_app/shared/misc/params_keys.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class DetailWishlist extends StatefulWidget {
  final GroupCartModel data;
  const DetailWishlist({super.key, required this.data});

  @override
  State<DetailWishlist> createState() => _DetailWishlistState();
}

class _DetailWishlistState extends State<DetailWishlist> {
  void _onLongTap(BuildContext context, CartModel selectedItem) {
    context.showDialogCustom(
        onPressed: () async {
          inject.get<FavoriteBloc>().add(RemoveProductItem(
              groupCartName: widget.data.groupCartName,
              productId: selectedItem.productId));
          setState(() {});
        },
        content: "Delete item ${selectedItem.productName}");
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        margin: StyleHelpers.topMarginScaffold,
        appbar: AppBar(title: Text(widget.data.groupCartName)),
        body: GridView.builder(
            itemCount: widget.data.items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 2, crossAxisSpacing: 2),
            itemBuilder: (context, index) {
              final memberdata = widget.data.items[index];
              return CardDetailWishlish(
                  data: memberdata,
                  onLongPress: (p0) => _onLongTap(context, p0),
                  onTap: (data) => context.pushNamed(RouteNames.detailitempage,
                      arguments: {ParamsKeys.cartProduct: data},
                      onComplete: () => setState(() {})));
            }));
  }
}
