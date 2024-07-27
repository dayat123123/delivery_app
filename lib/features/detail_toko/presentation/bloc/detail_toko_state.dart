part of 'detail_toko_bloc.dart';

abstract class DetailTokoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DetailTokoInitial extends DetailTokoState {}

class DetailTokoLoading extends DetailTokoState {}

class DetailTokoLoaded extends DetailTokoState {
  final DetailTokoModel detailToko;

  DetailTokoLoaded({required this.detailToko});

  @override
  List<Object?> get props => [detailToko];
}

class DetailTokoError extends DetailTokoState {
  final String message;

  DetailTokoError({required this.message});

  @override
  List<Object?> get props => [message];
}
