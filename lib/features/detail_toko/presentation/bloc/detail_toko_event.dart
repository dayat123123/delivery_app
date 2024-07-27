part of 'detail_toko_bloc.dart';

abstract class DetailTokoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadDetailToko extends DetailTokoEvent {
  final String sellerId;

  LoadDetailToko({required this.sellerId});

  @override
  List<Object?> get props => [sellerId];
}

class ReLoadCategories extends DetailTokoEvent {
  final String sellerId;
  final DetailTokoModel previousdetailToko;
  ReLoadCategories({required this.sellerId, required this.previousdetailToko});

  @override
  List<Object?> get props => [sellerId, previousdetailToko];
}
