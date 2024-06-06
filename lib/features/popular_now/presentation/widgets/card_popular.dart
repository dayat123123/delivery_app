import 'package:delivery_app/features/popular_now/domain/entities/popular_now.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/misc/params_key.dart';
import 'package:delivery_app/shared/misc/pathfile.dart';
import 'package:delivery_app/shared/misc/route_names.dart';
import 'package:delivery_app/shared/widgets/card.dart';
import 'package:flutter/material.dart';

class CardPopular extends StatelessWidget {
  final PopularNowModel produkModel;
  const CardPopular({super.key, required this.produkModel});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        onTap: () => context.pushNamed(RouteNames.detailitempage,
            arguments: {ParamsKey.idProduct: produkModel.idProduct}),
        width: 180,
        child: Stack(
          children: [
            Positioned(
                right: 5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.favorite, color: context.themeColors.downward),
                    Text(produkModel.jumSave.toString())
                  ],
                )),
            Column(children: [
              Expanded(
                  child: CircleAvatar(
                      radius: 55,
                      backgroundImage:
                          AssetImage(produkModel.imageUrl ?? PathFile.alljpg))),

              Text(produkModel.namaProduct,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.5))
                  .centerLeft,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Rp. ${produkModel.hargaProduct}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w500))
                      .centerLeft,
                  Text("${produkModel.jumTerjual} Sell",
                          maxLines: 1,
                          style: const TextStyle(fontWeight: FontWeight.w500))
                      .centerLeft
                ],
              ),
              // Row(children: [
              //   ...[
              //     const Icon(Icons.star,
              //             color: Colors.amber, size: 20)
              //         .spaceH(
              //             before: false,
              //             after: true,
              //             spacing: 5),
              //     Text("${produkModel.rating}",
              //             maxLines: 1,
              //             overflow: TextOverflow.ellipsis,
              //             style: const TextStyle(
              //                 fontWeight: FontWeight.w500))
              //         .centerLeft,
              //     const Spacer(),
              //     Text("${produkModel.jumTerjual} Sell",
              //             maxLines: 1,
              //             style: const TextStyle(
              //                 fontWeight: FontWeight.w500))
              //         .centerLeft
              //   ]
              // ])
            ]),
          ],
        )).marginOnly(right: 10);
  }
}
