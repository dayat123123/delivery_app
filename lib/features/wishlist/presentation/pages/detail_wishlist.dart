import 'package:delivery_app/core/utils/local_database/cart_model.dart';
import 'package:delivery_app/core/utils/local_database/group_cart_model.dart';
import 'package:delivery_app/core/utils/local_database/local_database_helper.dart';
import 'package:delivery_app/features/wishlist/presentation/widgets/card_detail_wishlish.dart';
import 'package:delivery_app/injector.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
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
  late List<CartModel> memberData;
  final _store = inject.get<DatabaseHelper>();
  @override
  void initState() {
    memberData = widget.data.items ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        margin: StyleHelpers.verticalPadding,
        appbar: AppBar(title: Text(widget.data.groupCartName)),
        body: GridView.builder(
            itemCount: memberData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 2, crossAxisSpacing: 2),
            itemBuilder: (context, index) => CardDetailWishlish(
                data: memberData[index],
                onTap: (data) => context.pushNamed(RouteNames.detailitempage,
                        arguments: {ParamsKeys.cartProduct: data},
                        onComplete: () async {
                      memberData = await _store
                          .getSingleGroupFavorit(widget.data.groupCartName);
                      setState(() {});
                    }))));
  }
}
