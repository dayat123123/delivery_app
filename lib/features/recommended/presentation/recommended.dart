import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/recommended/data/get_recommended_repositories.dart';
import 'package:delivery_app/features/recommended/domain/entities/recommended.dart';
import 'package:delivery_app/features/recommended/domain/usecases/get_recommended/get_recommended.dart';
import 'package:delivery_app/features/recommended/presentation/widgets/card_recommended.dart';
import 'package:flutter/material.dart';

class Recommended extends StatelessWidget {
  const Recommended({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetRecommended(
                recommendedRepositories: RecommendedRepositoriesImpl())
            .call(null),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            var data = snapshot.data;
            if (data is Success) {
              if (data?.resultValue != null) {
                List<RecommendedModel> produkModel = data!.resultValue!;
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    produkModel.length,
                    (index) {
                      return CardRecommended(produkModel: produkModel[index]);
                    },
                  ),
                );
              } else {
                return const Text('Result value is null');
              }
            } else {
              if (data?.errorMessage != null) {
                return Text(data!.errorMessage.toString());
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
