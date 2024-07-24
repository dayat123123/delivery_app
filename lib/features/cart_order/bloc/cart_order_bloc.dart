import 'package:delivery_app/core/utils/local_database/group_order_cart_model.dart';
import 'package:delivery_app/core/utils/local_database/local_database_helper.dart';
import 'package:delivery_app/core/utils/local_database/order_cart_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'cart_order_event.dart';
part 'cart_order_state.dart';

class CartOrderBloc extends Bloc<CartOrderEvent, CartOrderState> {
  final DatabaseHelper databaseHelper;
  CartOrderBloc({required this.databaseHelper}) : super(CartOrderLoading()) {
    on<LoadCartOrder>(_onLoadCartOrder);
    on<ReloadLoadCartOrder>(_onReloadCartOrder);
    on<UpdateItemsInCartOrderGroup>(_onUpdateItemInGroupCart);
    on<RemoveItemsOnCartOrderGroup>(_onRemoveItemInGroupCart);
    on<RemoveCartOrderGroup>(_onRemoveOrderCartGroup);
  }

  void _onLoadCartOrder(
      LoadCartOrder event, Emitter<CartOrderState> emit) async {
    try {
      emit(CartOrderLoading());
      final result = await databaseHelper.getAllOrderCart();
      final int length = await databaseHelper.getLengthProductInCart();
      emit(CartOrderLoaded(dataList: result, lengthProductGroup: length));
    } catch (e) {
      emit(CartOrderError(error: e.toString()));
    }
  }

  _onReloadCartOrder(
      ReloadLoadCartOrder event, Emitter<CartOrderState> emit) async {
    try {
      emit(CartOrderLoading());
      final result = await databaseHelper.getAllOrderCart();
      final int length = await databaseHelper.getLengthProductInCart();
      await Future.delayed(const Duration(seconds: 1));
      event.controller.refreshCompleted();
      emit(CartOrderLoaded(dataList: result, lengthProductGroup: length));
    } catch (e) {
      event.controller.refreshCompleted();
      emit(CartOrderError(error: e.toString()));
    }
  }

  void _onRemoveOrderCartGroup(
      RemoveCartOrderGroup event, Emitter<CartOrderState> emit) async {
    if (state is CartOrderLoaded) {
      final currentState = state as CartOrderLoaded;
      try {
        bool isSuccess = await databaseHelper.removeOrderCartGroup(
            groupCartOrderId: event.cartOrderGroupId);
        if (isSuccess) {
          List<GroupOrderCartModel> updatedDataList =
              List.from(currentState.dataList);
          updatedDataList.removeWhere(
              (element) => element.groupOrderCartId == event.cartOrderGroupId);
          final int length = await databaseHelper.getLengthProductInCart();
          emit(CartOrderLoaded(
              dataList: updatedDataList, lengthProductGroup: length));
        }
      } catch (e) {
        emit(CartOrderError(error: e.toString()));
      }
    }
  }

  void _onUpdateItemInGroupCart(
      UpdateItemsInCartOrderGroup event, Emitter<CartOrderState> emit) async {
    if (state is CartOrderLoaded) {
      try {
        await databaseHelper.updateItemsInCartOrderGroup(
            newItem: event.newItem, groupData: event.groupData);
      } catch (e) {
        emit(CartOrderError(error: e.toString()));
      }
    }
  }

  void _onRemoveItemInGroupCart(
      RemoveItemsOnCartOrderGroup event, Emitter<CartOrderState> emit) async {
    if (state is CartOrderLoaded) {
      try {
        bool isSuccess = await databaseHelper.removeItemsInCartOrderGroup(
            newItem: event.deleteItem, groupData: event.groupData);
        if (isSuccess) {
          final currentState = state as CartOrderLoaded;
          List<GroupOrderCartModel> updatedDataList =
              List.from(currentState.dataList);
          int groupIndex = updatedDataList.indexWhere((element) =>
              element.groupOrderCartId == event.groupData.groupOrderCartId);
          if (groupIndex == -1) return;

          GroupOrderCartModel groupData = updatedDataList[groupIndex];
          List<OrderCartModel> items = List.from(groupData.items ?? []);

          items.removeWhere(
              (element) => element.productId == event.deleteItem.productId);
          updatedDataList[groupIndex] =
              groupData.copyWith(items: items.isNotEmpty ? items : []);

          final int length = await databaseHelper.getLengthProductInCart();
          emit(CartOrderLoaded(
              dataList: updatedDataList, lengthProductGroup: length));
        }
      } catch (e) {
        emit(CartOrderError(error: e.toString()));
      }
    }
  }
}
