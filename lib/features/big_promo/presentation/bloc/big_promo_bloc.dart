import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/big_promo/presentation/bloc/big_promo_event.dart';
import 'package:delivery_app/features/big_promo/data/big_promo_repositories.dart';
import 'package:delivery_app/features/big_promo/domain/entities/big_promo_model.dart';
import 'package:delivery_app/features/big_promo/domain/usecases/get_big_promo.dart';
import 'package:delivery_app/injector.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'big_promo_state.dart';

class BigPromoBloc extends Bloc<BigPromoEvent, BigPromoState> {
  final GetBigPromo getBigPromo = GetBigPromo(
      bigPromoRepositoriesImpl: inject.get<BigPromoRepositoriesImpl>());

  BigPromoBloc() : super(BigPromoInitial()) {
    on<FetchBigPromo>((event, emit) async {
      emit(BigPromoLoading());
      final result = await getBigPromo.call(null);
      if (result is Success) {
        final data = result.resultValue;
        emit(BigPromoLoaded(bigPromoProduct: data ?? []));
      } else {
        emit(BigPromoError(error: result.errorMessage.toString()));
      }
    });
  }
}
