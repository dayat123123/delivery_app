import 'package:delivery_app/features/recommended/presentation/bloc/recommended_bloc.dart';
import 'package:delivery_app/features/recommended/presentation/widgets/card_recommended.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Recommended extends StatelessWidget {
  final RecommendedBloc recommendedBloc;
  const Recommended({super.key, required this.recommendedBloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => recommendedBloc,
      child: BlocBuilder<RecommendedBloc, RecommendedState>(
        builder: (context, state) {
          if (state is RecommendedLoading) {
            return ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(width: StyleHelpers.rightMargin),
                itemCount: 3,
                padding: StyleHelpers.horizontalPadding,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    const CardRecommended(isLoading: true));
          } else if (state is RecommendedLoaded) {
            final listdata = state.recommendedProduct;
            return ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(width: StyleHelpers.rightMargin),
                itemCount: listdata.length,
                padding: StyleHelpers.horizontalPadding,
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
