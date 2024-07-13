import 'package:delivery_app/features/big_promo/bloc/big_promo_bloc.dart';
import 'package:delivery_app/features/big_promo/domain/entities/big_promo_model.dart';
import 'package:delivery_app/features/big_promo/presentation/widgets/card_big_promo.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/carousel.dart';
import 'package:delivery_app/shared/misc/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BigPromo extends StatelessWidget {
  final BigPromoBloc bigPromoBloc;
  const BigPromo({super.key, required this.bigPromoBloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BigPromoBloc>(
      lazy: false,
      create: (context) => bigPromoBloc,
      child: BlocBuilder<BigPromoBloc, BigPromoState>(
        builder: (context, state) {
          if (state is BigPromoLoading) {
            return const CardBigPromo(isLoading: true).marginSymmetric(
                horizontal: SpacerHelper.horizontalPaddingnumber);
          } else if (state is BigPromoLoaded) {
            List<BigPromoModel> bigpromodata = state.bigPromoProduct;
            final datawidget = List.generate(bigpromodata.length,
                (index) => CardBigPromo(bigPromoModel: bigpromodata[index]));
            return CustomCarousel(
                animateView: true,
                listwidget: datawidget,
                positionedIndicatorBottom: 15);
          } else if (state is BigPromoError) {
            return Center(child: Text(state.error));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
