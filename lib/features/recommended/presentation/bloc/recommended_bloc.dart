import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/recommended/presentation/bloc/recommended_event.dart';
import 'package:delivery_app/features/recommended/data/get_recommended_repositories.dart';
import 'package:delivery_app/features/recommended/domain/entities/recommended.dart';
import 'package:delivery_app/features/recommended/domain/usecases/get_recommended/get_recommended.dart';
import 'package:delivery_app/injector.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'recommended_state.dart';

class RecommendedBloc extends Bloc<RecommendedEvent, RecommendedState> {
  final GetRecommended getRecommended = GetRecommended(
      recommendedRepositories: inject.get<RecommendedRepositoriesImpl>());

  RecommendedBloc() : super(RecommendedInitial()) {
    on<FetchRecommended>((event, emit) async {
      emit(RecommendedLoading());
      final result = await getRecommended.call(null);
      if (result is Success) {
        final data = result.resultValue;
        emit(RecommendedLoaded(recommendedProduct: data ?? []));
      } else {
        emit(RecommendedError(error: result.errorMessage.toString()));
      }
    });
  }
}
