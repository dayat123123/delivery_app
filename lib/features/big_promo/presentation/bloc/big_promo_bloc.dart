import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/big_promo/domain/repositories/big_promo_repository.dart';
import 'package:delivery_app/features/big_promo/presentation/bloc/big_promo_event.dart';
import 'package:delivery_app/features/big_promo/domain/entities/big_promo_model.dart';
import 'package:delivery_app/features/big_promo/domain/usecases/get_big_promo.dart';
import 'package:delivery_app/dependency_injection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'big_promo_state.dart';

class BigPromoBloc extends Bloc<BigPromoEvent, BigPromoState> {
  final GetBigPromosUseCase _getBigPromoUseCase =
      GetBigPromosUseCase(inject.get<BigPromoRepository>());

  BigPromoBloc() : super(BigPromoInitial()) {
    on<FetchBigPromo>((event, emit) async {
      emit(BigPromoLoading());
      final result = await _getBigPromoUseCase.call(null);
      if (result is Success) {
        final data = result.resultValue;
        emit(BigPromoLoaded(bigPromoProduct: data ?? []));
      } else {
        emit(BigPromoError(error: result.errorMessage.toString()));
      }
    });
  }
}
