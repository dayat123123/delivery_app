import 'package:delivery_app/features/popular_now/bloc/popular_now_bloc.dart';
import 'package:delivery_app/features/popular_now/domain/entities/popular_now.dart';
import 'package:delivery_app/features/popular_now/presentation/widgets/card_popular.dart';
import 'package:delivery_app/shared/widgets/spacer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularNow extends StatelessWidget {
  final PopularNowBloc popularNowBloc;
  const PopularNow({super.key, required this.popularNowBloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PopularNowBloc>(
      lazy: false,
      create: (context) => popularNowBloc,
      child: BlocBuilder<PopularNowBloc, PopularNowState>(
        bloc: popularNowBloc,
        builder: (context, state) {
          if (state is PopularNowLoading) {
            return ListView.builder(
                itemCount: 5,
                padding: SpacerHelper.horizontalPadding,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    const CardPopular(isLoading: true));
          } else if (state is PopularNowLoaded) {
            List<PopularNowModel> produkModel = state.detailproduct;
            return ListView.builder(
                itemCount: produkModel.length,
                padding: SpacerHelper.horizontalPadding,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    CardPopular(produkModel: produkModel[index]));
          } else if (state is PopularNowError) {
            return Center(child: Text(state.error));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
