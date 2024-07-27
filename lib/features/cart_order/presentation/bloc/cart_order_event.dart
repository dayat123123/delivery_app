part of 'cart_order_bloc.dart';

abstract class CartOrderEvent extends Equatable {
  const CartOrderEvent();
  @override
  List<Object> get props => [];
}

class LoadCartOrder extends CartOrderEvent {
  @override
  List<Object> get props => [];
}

class ReloadLoadCartOrder extends CartOrderEvent {
  final RefreshController controller;
  const ReloadLoadCartOrder({required this.controller});
  @override
  List<Object> get props => [controller];
}

class RemoveCartOrderGroup extends CartOrderEvent {
  final String cartOrderGroupId;
  const RemoveCartOrderGroup({required this.cartOrderGroupId});

  @override
  List<Object> get props => [cartOrderGroupId];
}

class RemoveItemsOnCartOrderGroup extends CartOrderEvent {
  final OrderCartModel deleteItem;
  final GroupOrderCartModel groupData;
  const RemoveItemsOnCartOrderGroup(
      {required this.deleteItem, required this.groupData});

  @override
  List<Object> get props => [deleteItem, groupData];
}

class UpdateItemsInCartOrderGroup extends CartOrderEvent {
  final OrderCartModel newItem;
  final GroupOrderCartModel groupData;
  const UpdateItemsInCartOrderGroup(
      {required this.newItem, required this.groupData});
  @override
  List<Object> get props => [newItem, groupData];
}

class InsertItemToCart extends CartOrderEvent {
  final GroupOrderCartModel data;
  final void Function() onDone;
  const InsertItemToCart(this.onDone, {required this.data});
  @override
  List<Object> get props => [data];
}
