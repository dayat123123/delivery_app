import 'package:delivery_app/shared/constans/pathfile.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("ddd");
      },
      child: Container(
        padding:
            const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 15),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: context.themeColors.appContainerBackground,
        ),
        child: Column(
          children: [
            const Expanded(
              child: CircleAvatar(
                  radius: 45, backgroundImage: AssetImage(PathFile.femalejpg)),
            ),
            const SizedBox(height: 10),
            Text("Nasi Goreng Empang Briyani",
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.5))
                .centerLeft,
            Text(
              "Rp. 100.000",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            ).centerLeft,
            Row(
              children: [
                ...[
                  const Icon(Icons.star, color: Colors.amber, size: 20)
                      .spaceH(before: false, after: true, spacing: 5),
                  Text("4.8",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold))
                      .centerLeft,
                  Spacer(),
                  Text("10 Sell",
                          maxLines: 1,
                          style: TextStyle(fontWeight: FontWeight.bold))
                      .centerLeft,
                ],
              ],
            ),
          ],
        ),
      ),
    ).marginOnly(right: 10);
  }
}
