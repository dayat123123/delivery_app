import 'package:delivery_app/features/recommended/bloc/recommended_bloc.dart';
import 'package:delivery_app/features/recommended/presentation/widgets/card_recommended.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/misc/spacer_helpers.dart';
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
            return ListView.builder(
                itemCount: 5,
                padding: SpacerHelper.horizontalPadding,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    const CardRecommended(isLoading: true));
          } else if (state is RecommendedLoaded) {
            final listdata = state.recommendedProduct;
            return ListView.builder(
                itemCount: listdata.length,
                padding: SpacerHelper.horizontalPadding,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    CardRecommended(recommendedModel: listdata[index]));
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
