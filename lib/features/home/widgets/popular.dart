import 'package:delivery_app/shared/constans/pathfile.dart';
import 'package:delivery_app/shared/constans/route_names.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/card.dart';
import 'package:flutter/material.dart';

class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
            5,
            (index) => CustomCard(
                onTap: () => context.pushNamed(RouteNames.detailitempage),
                width: 200,
                child: Column(children: [
                  const Expanded(
                      child: CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage(PathFile.malejpg))),
                  const SizedBox(height: 10),
                  const Text("Nasi Padang Mantap",
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.5))
                      .centerLeft,
                  const Text("Rp. 15.000",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w500))
                      .centerLeft,
                  Row(children: [
                    ...[
                      const Icon(Icons.star, color: Colors.amber, size: 20)
                          .spaceH(before: false, after: true, spacing: 5),
                      const Text("4.8",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.w500))
                          .centerLeft,
                      const Spacer(),
                      const Text("10 Sell",
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.w500))
                          .centerLeft
                    ]
                  ])
                ])).marginOnly(right: 10)));
  }
}
