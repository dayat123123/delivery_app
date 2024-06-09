part of 'big_promo_bloc.dart';

abstract class BigPromoState extends Equatable {
  const BigPromoState();
  @override
  List<Object> get props => [];
}

class BigPromoInitial extends BigPromoState {}

class BigPromoLoading extends BigPromoState {}

class BigPromoLoaded extends BigPromoState {
  final List<BigPromoModel> bigPromoProduct;

  const BigPromoLoaded({required this.bigPromoProduct});
  @override
  List<Object> get props => [bigPromoProduct];
}

class BigPromoError extends BigPromoState {
  final String error;
  const BigPromoError({required this.error});
}
