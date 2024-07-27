import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/cart_order/domain/repositories/cart_order_repository.dart';
import 'package:delivery_app/features/cart_order/domain/usecases/create_new_group_order_cart/create_new_group_order_cart.dart';
import 'package:delivery_app/features/cart_order/domain/usecases/get_list_order_cart/get_list_order_cart.dart';
import 'package:delivery_app/features/cart_order/domain/usecases/get_total_product_in_cart/get_total_product_in_cart.dart';
import 'package:delivery_app/features/cart_order/domain/usecases/remove_group_order_cart/remove_group_order_cart.dart';
import 'package:delivery_app/features/cart_order/domain/usecases/remove_item_in_group_order_cart/remove_item_in_group_order_cart.dart';
import 'package:delivery_app/features/cart_order/domain/usecases/update_items_in_group_order_cart/update_items_in_group_order_cart.dart';
import 'package:delivery_app/features/cart_order/domain/usecases/utils/group_order_cart_params.dart';
import 'package:delivery_app/injector.dart';
import 'package:delivery_app/features/cart_order/domain/entities/group_order_cart_model.dart';
import 'package:delivery_app/features/cart_order/domain/entities/order_cart_model.dart';
import 'package:delivery_app/shared/misc/formatter.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'cart_order_event.dart';
part 'cart_order_state.dart';

class CartOrderBloc extends Bloc<CartOrderEvent, CartOrderState> {
  static final _repository = inject.get<CartOrderRepository>();
  final getListOrderCart = GetListOrderCartUseCase(_repository);
  final getTotalProductInCart = GetTotalProductInOrderCartUseCase(_repository);
  final removeGroupCartOrder = RemoveGroupOrderCart(_repository);
  final updateItemsInGroupOrderCart = UpdateItemsInGroupOrderCart(_repository);
  final removeItemInGroupOrderCart = RemoveItemInGroupOrderCart(_repository);
  final insertItemToCart = CreateNewGroupOrderCart(_repository);
  CartOrderBloc() : super(CartOrderLoading()) {
    on<LoadCartOrder>(_onLoadCartOrder);
    on<ReloadLoadCartOrder>(_onReloadCartOrder);
    on<UpdateItemsInCartOrderGroup>(_onUpdateItemInGroupCartOrder);
    on<RemoveItemsOnCartOrderGroup>(_onRemoveItemInGroupCartOrder);
    on<RemoveCartOrderGroup>(_onRemoveGroupCartOrder);
    on<InsertItemToCart>(_onInsertItemToCart);
  }
  void _onLoadCartOrder(
      LoadCartOrder event, Emitter<CartOrderState> emit) async {
    emit(CartOrderLoading());
    final result = await getListOrderCart.call(null);
    if (result is Success) {
      final datalist = result.resultValue!;
      final resultLength = await getTotalProductInCart.call(null);
      if (resultLength is Success) {
        emit(CartOrderLoaded(
            dataList: datalist, lengthProductGroup: resultLength.resultValue!));
      } else {
        emit(CartOrderError(
            error: Formatter.errorMessageCatchException(
                resultLength.errorMessage.toString())));
      }
    } else {
      emit(CartOrderError(
          error: Formatter.errorMessageCatchException(
              result.errorMessage.toString())));
    }
  }

  _onReloadCartOrder(
      ReloadLoadCartOrder event, Emitter<CartOrderState> emit) async {
    emit(CartOrderLoading());
    final result = await getListOrderCart.call(null);
    if (result is Success) {
      final datalist = result.resultValue!;
      final resultLength = await getTotalProductInCart.call(null);
      if (resultLength is Success) {
        await Future.delayed(const Duration(seconds: 1));
        event.controller.refreshCompleted();
        emit(CartOrderLoaded(
            dataList: datalist, lengthProductGroup: resultLength.resultValue!));
      } else {
        event.controller.refreshCompleted();
        emit(CartOrderError(
            error: Formatter.errorMessageCatchException(
                resultLength.errorMessage.toString())));
      }
    } else {
      event.controller.refreshCompleted();
      emit(CartOrderError(
          error: Formatter.errorMessageCatchException(
              result.errorMessage.toString())));
    }
  }

  void _onInsertItemToCart(
      InsertItemToCart event, Emitter<CartOrderState> emit) async {
    final result = await insertItemToCart.call(event.data);
    if (result is Success) {
      final datalist = result.resultValue!;
      final resultLength = await getTotalProductInCart.call(null);
      if (resultLength is Success) {
        event.onDone();
        emit(CartOrderLoaded(
            dataList: datalist, lengthProductGroup: resultLength.resultValue!));
      } else {
        emit(CartOrderError(
            error: Formatter.errorMessageCatchException(
                resultLength.errorMessage.toString())));
      }
    } else {
      emit(CartOrderError(
          error: Formatter.errorMessageCatchException(
              result.errorMessage.toString())));
    }
  }

  void _onRemoveGroupCartOrder(
      RemoveCartOrderGroup event, Emitter<CartOrderState> emit) async {
    final result = await removeGroupCartOrder.call(event.cartOrderGroupId);
    if (result is Success) {
      final datalist = result.resultValue!;
      final resultLength = await getTotalProductInCart.call(null);
      if (resultLength is Success) {
        emit(CartOrderLoaded(
            dataList: datalist, lengthProductGroup: resultLength.resultValue!));
      } else {
        emit(CartOrderError(
            error: Formatter.errorMessageCatchException(
                resultLength.errorMessage.toString())));
      }
    } else {
      emit(CartOrderError(
          error: Formatter.errorMessageCatchException(
              result.errorMessage.toString())));
    }
  }

  void _onUpdateItemInGroupCartOrder(
      UpdateItemsInCartOrderGroup event, Emitter<CartOrderState> emit) async {
    final result = await updateItemsInGroupOrderCart.call(
        OrderCartAndGroupCartParam(
            orderCartModel: event.newItem,
            groupOrderCartModel: event.groupData));
    if (result is Success) {
      final datalist = result.resultValue!;
      final resultLength = await getTotalProductInCart.call(null);
      if (resultLength is Success) {
        emit(CartOrderLoaded(
            dataList: datalist, lengthProductGroup: resultLength.resultValue!));
      } else {
        emit(CartOrderError(
            error: Formatter.errorMessageCatchException(
                resultLength.errorMessage.toString())));
      }
    } else {
      emit(CartOrderError(
          error: Formatter.errorMessageCatchException(
              result.errorMessage.toString())));
    }
  }

  void _onRemoveItemInGroupCartOrder(
      RemoveItemsOnCartOrderGroup event, Emitter<CartOrderState> emit) async {
    final result = await removeItemInGroupOrderCart.call(
        OrderCartAndGroupCartParam(
            orderCartModel: event.deleteItem,
            groupOrderCartModel: event.groupData));
    if (result is Success) {
      final datalist = result.resultValue!;
      final resultLength = await getTotalProductInCart.call(null);
      if (resultLength is Success) {
        emit(CartOrderLoaded(
            dataList: datalist, lengthProductGroup: resultLength.resultValue!));
      } else {
        emit(CartOrderError(
            error: Formatter.errorMessageCatchException(
                resultLength.errorMessage.toString())));
      }
    } else {
      emit(CartOrderError(
          error: Formatter.errorMessageCatchException(
              result.errorMessage.toString())));
    }
  }
}
