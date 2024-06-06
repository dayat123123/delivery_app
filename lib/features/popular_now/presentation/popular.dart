import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/popular_now/data/popular_now_repositories.dart';
import 'package:delivery_app/features/popular_now/domain/entities/popular_now.dart';
import 'package:delivery_app/features/popular_now/domain/usecases/get_popular_now/get_popular_now.dart';
import 'package:delivery_app/features/popular_now/presentation/widgets/card_popular.dart';
import 'package:flutter/material.dart';

class PopularNow extends StatelessWidget {
  const PopularNow({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetPopularNow(
                popularNowRepositoriesImpl: PopularNowRepositoriesImpl())
            .call(null),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            var data = snapshot.data;
            if (data is Success) {
              if (data?.resultValue != null) {
                List<PopularNowModel> produkModel = data!.resultValue!;
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(produkModel.length,
                      (index) => CardPopular(produkModel: produkModel[index])),
                );
              } else {
                return const Text('Result value is null');
              }
            } else {
              if (data?.errorMessage != null) {
                return Text(data!.errorMessage!);
              } else {
                return const Text('Unknown error occurred');
              }
            }
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const SizedBox();
          }
        });
  }
}
