import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/popular_now/bloc/popular_now_event.dart';
import 'package:delivery_app/features/popular_now/domain/entities/popular_now.dart';
import 'package:delivery_app/features/popular_now/domain/usecases/get_popular_now/get_popular_now.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'popular_now_state.dart';

class PopularNowBloc extends Bloc<PopularNowEvent, PopularNowState> {
  final GetPopularNow getPopularNow;

  PopularNowBloc({required this.getPopularNow}) : super(PopularNowInitial()) {
    on<FetchPopularNow>((event, emit) async {
      emit(PopularNowLoading());
      final result = await getPopularNow.call(null);
      if (result is Success) {
        final data = result.resultValue;
        emit(PopularNowLoaded(detailproduct: data ?? []));
      } else {
        emit(PopularNowError(error: result.errorMessage.toString()));
      }
    });
  }
}
