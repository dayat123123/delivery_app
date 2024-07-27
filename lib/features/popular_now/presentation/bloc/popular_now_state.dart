part of 'popular_now_bloc.dart';

abstract class PopularNowState extends Equatable {
  const PopularNowState();
  @override
  List<Object> get props => [];
}

class PopularNowInitial extends PopularNowState {}

class PopularNowLoading extends PopularNowState {}

class PopularNowLoaded extends PopularNowState {
  final List<PopularNowModel> detailproduct;

  const PopularNowLoaded({required this.detailproduct});
  @override
  List<Object> get props => [detailproduct];
}

class PopularNowError extends PopularNowState {
  final String error;
  const PopularNowError({required this.error});
}
