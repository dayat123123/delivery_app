part of 'detail_product_bloc.dart';

abstract class DetailProductState extends Equatable {
  const DetailProductState();

  @override
  List<Object> get props => [];
}

class DetailProductLoading extends DetailProductState {}

class DetailProductLoaded extends DetailProductState {
  final DetailProductModel detailproduct;

  const DetailProductLoaded({required this.detailproduct});
  @override
  List<Object> get props => [detailproduct];
}

class DetailProductError extends DetailProductState {
  final String error;

  const DetailProductError({required this.error});
}
