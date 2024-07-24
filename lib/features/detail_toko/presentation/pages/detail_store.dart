import 'package:delivery_app/features/detail_toko/bloc/detail_toko_bloc.dart';
import 'package:delivery_app/features/detail_toko/domain/usecases/get_detail_toko/get_detail_toko.dart';
import 'package:delivery_app/features/detail_toko/presentation/widgets/detail_toko_widgets.dart';
import 'package:delivery_app/injector.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/widgets/network_image.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:delivery_app/shared/widgets/shimmer.dart';
import 'package:delivery_app/shared/widgets/sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailStore extends StatefulWidget {
  final String sellerId;
  final String sellerName;
  const DetailStore(
      {super.key, required this.sellerId, required this.sellerName});

  @override
  State<DetailStore> createState() => _DetailStoreState();
}

class _DetailStoreState extends State<DetailStore> {
  bool isloadingAllProduct = false;
  bool isloadingCategories = false;
  late DetailTokoBloc _detailTokoBloc;
  @override
  void initState() {
    _detailTokoBloc =
        DetailTokoBloc(getDetailToko: inject.get<GetDetailToko>());
    super.initState();
  }

  @override
  void dispose() {
    _detailTokoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        padding: EdgeInsets.zero,
        body: BlocProvider(
            create: (context) =>
                _detailTokoBloc..add(LoadDetailToko(sellerId: widget.sellerId)),
            child: BlocBuilder<DetailTokoBloc, DetailTokoState>(
                builder: (context, state) {
              if (state is DetailTokoLoading) {
                return CustomSliverAppbar(
                    title: Text(widget.sellerName),
                    listtab: listTabDetailStore(
                        isloadingAboutStore: true,
                        isloadingAllProduct: true,
                        isloadingCategories: true),
                    backgroundAppbar: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(24.0),
                            bottomRight: Radius.circular(24.0)),
                        child: CustomShimmer(
                            height: context.fullHeight,
                            width: context.fullWidth)));
              } else if (state is DetailTokoLoaded) {
                final data = state.detailToko;
                return CustomSliverAppbar(
                    title: Text(widget.sellerName),
                    listtab: listTabDetailStore(
                        isloadingAllProduct: isloadingAllProduct,
                        isloadingCategories: isloadingCategories,
                        listProduct: data.listProduct,
                        listCategories: data.categories),
                    backgroundAppbar: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(24.0),
                            bottomRight: Radius.circular(24.0)),
                        child:
                            CustomNetworkImage(networkImgUrl: data.imageUrl)));
              } else if (state is DetailTokoError) {
                return Center(child: Text("Error : ${state.message}"));
              } else {
                return const SizedBox.shrink();
              }
            })));
  }
}

void testRefetch(void Function() onDone) async {
  await Future.delayed(Duration(seconds: 2));
  onDone();
}
