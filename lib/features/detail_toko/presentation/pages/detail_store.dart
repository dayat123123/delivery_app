import 'package:delivery_app/features/detail_toko/presentation/widgets/detail_store_widgets.dart';
import 'package:delivery_app/shared/widgets/network_image.dart';
import 'package:delivery_app/shared/widgets/sliver_appbar.dart';
import 'package:flutter/material.dart';

class DetailStore extends StatefulWidget {
  final String sellerId;
  const DetailStore({super.key, required this.sellerId});

  @override
  State<DetailStore> createState() => _DetailStoreState();
}

class _DetailStoreState extends State<DetailStore> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomSliverAppbar(
        title: widget.sellerId,
        listtab: listTabDetailStore,
        backgroundAppbar: const ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24.0),
                bottomRight: Radius.circular(24.0)),
            child: CustomNetworkImage(
                networkImgUrl:
                    "https://images.unsplash.com/photo-1547721064-da6cfb341d50")));
  }
}
