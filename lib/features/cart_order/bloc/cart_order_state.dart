part of 'cart_order_bloc.dart';

abstract class CartOrderState extends Equatable {
  const CartOrderState();
  @override
  List<Object> get props => [];
}

class CartOrderLoading extends CartOrderState {}

class CartOrderLoaded extends CartOrderState {
  final List<GroupOrderCartModel> dataList;
  final int lengthProductGroup;
  const CartOrderLoaded(
      {required this.dataList, required this.lengthProductGroup});
  @override
  List<Object> get props => [dataList];
}

class CartOrderError extends CartOrderState {
  final String error;
  const CartOrderError({required this.error});
}
