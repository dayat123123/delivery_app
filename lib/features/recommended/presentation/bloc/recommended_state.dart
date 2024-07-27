part of 'recommended_bloc.dart';

abstract class RecommendedState extends Equatable {
  const RecommendedState();
  @override
  List<Object> get props => [];
}

class RecommendedInitial extends RecommendedState {}

class RecommendedLoading extends RecommendedState {}

class RecommendedLoaded extends RecommendedState {
  final List<RecommendedModel> recommendedProduct;

  const RecommendedLoaded({required this.recommendedProduct});
  @override
  List<Object> get props => [recommendedProduct];
}

class RecommendedError extends RecommendedState {
  final String error;
  const RecommendedError({required this.error});
}
