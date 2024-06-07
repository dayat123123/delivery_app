import 'package:delivery_app/features/recommended/bloc/recommended_bloc.dart';
import 'package:delivery_app/features/recommended/domain/entities/recommended.dart';
import 'package:delivery_app/features/recommended/presentation/widgets/card_recommended.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Recommended extends StatelessWidget {
  final RecommendedBloc recommendedBloc;
  const Recommended({super.key, required this.recommendedBloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => recommendedBloc,
      child: BlocBuilder<RecommendedBloc, RecommendedState>(
        builder: (context, state) {
          if (state is RecommendedLoading) {
            return ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(5, (index) {
                return const CardRecommended(
                  isLoading: true,
                  recommendedModel: RecommendedModel(
                      idProduct: '',
                      namaProduct: '',
                      hargaProduct: 0,
                      jumTerjual: 0,
                      jumSave: 0,
                      rating: 0),
                );
              }),
            );
          } else if (state is RecommendedLoaded) {
            final listdata = state.recommendedProduct;
            return ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(listdata.length, (index) {
                  return CardRecommended(recommendedModel: listdata[index]);
                }));
          } else if (state is RecommendedError) {
            return Text(state.error).center;
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
