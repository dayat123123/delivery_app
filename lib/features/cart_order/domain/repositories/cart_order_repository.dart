// lib/features/cart_order/domain/repositories/cart_order_repository.dart

import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/cart_order/data/data_sources/cart_order_local_data_source.dart';
import 'package:delivery_app/features/cart_order/domain/entities/group_order_cart_model.dart';
import 'package:delivery_app/features/cart_order/domain/entities/order_cart_model.dart';
import 'package:delivery_app/shared/misc/formatter.dart';

abstract class CartOrderRepository {
  Future<Result<List<GroupOrderCartModel>>> getListOrderCart();
  Future<Result<int>> getTotalProductInOrderCart();
  Future<Result<List<GroupOrderCartModel>>> createNewGroupOrderCart(
      GroupOrderCartModel newOrderGroupCar);
  Future<Result<List<GroupOrderCartModel>>> removeGroupOrderCart(
      String groupCartOrderId);
  Future<Result<List<GroupOrderCartModel>>> updateItemsInCartOrderGroup(
      {required OrderCartModel newItem,
      required GroupOrderCartModel groupData});
  Future<Result<List<GroupOrderCartModel>>> removeItemsInCartOrderGroup(
      {required OrderCartModel deleteItem,
      required GroupOrderCartModel groupData});
}

class CartOrderRepositoryImpl implements CartOrderRepository {
  final CartOrderLocalDataSource _localDataSource;

  CartOrderRepositoryImpl(this._localDataSource);

  @override
  Future<Result<List<GroupOrderCartModel>>> getListOrderCart() async {
    try {
      final carts = await _localDataSource.fetchGroupOrderCarts();
      return Result.success(carts);
    } catch (e) {
      return Result.failed(Formatter.errorMessageCatchException(e.toString()));
    }
  }

  @override
  Future<Result<int>> getTotalProductInOrderCart() async {
    try {
      final carts = await _localDataSource.fetchGroupOrderCarts();
      int totalData = carts.fold(0, (sum, group) => sum + group.items.length);
      return Result.success(totalData);
    } catch (e) {
      return Result.failed(Formatter.errorMessageCatchException(e.toString()));
    }
  }

  @override
  Future<Result<List<GroupOrderCartModel>>> createNewGroupOrderCart(
      GroupOrderCartModel newOrderGroupCar) async {
    try {
      final groups = await _localDataSource.fetchGroupOrderCarts();
      final existingGroupIndex = groups.indexWhere((group) =>
          group.groupOrderCartId == newOrderGroupCar.groupOrderCartId);

      if (existingGroupIndex == -1) {
        groups.insert(0, newOrderGroupCar);
      } else {
        final existingGroup = groups[existingGroupIndex];
        final updatedItems = List<OrderCartModel>.from(existingGroup.items);

        for (var newItem in newOrderGroupCar.items) {
          final itemIndex = updatedItems
              .indexWhere((item) => item.productId == newItem.productId);

          if (itemIndex == -1) {
            updatedItems.add(newItem);
          } else {
            final existingItem = updatedItems[itemIndex];
            updatedItems[itemIndex] = existingItem.copyWith(
              quantity: existingItem.quantity + newItem.quantity,
              productPrice: newItem.productPrice,
              productImage: newItem.productImage,
            );
          }
        }

        groups[existingGroupIndex] =
            existingGroup.copyWith(items: updatedItems);
      }

      await _localDataSource.saveGroupOrderCarts(groups);
      return Result.success(groups);
    } catch (e) {
      return Result.failed(Formatter.errorMessageCatchException(e.toString()));
    }
  }

  @override
  Future<Result<List<GroupOrderCartModel>>> removeGroupOrderCart(
      String groupCartOrderId) async {
    try {
      final groups = await _localDataSource.fetchGroupOrderCarts();
      final groupIndex = groups
          .indexWhere((group) => group.groupOrderCartId == groupCartOrderId);

      if (groupIndex == -1) {
        return const Result.failed(Formatter.errorMessageDataNotFound);
      }

      groups.removeAt(groupIndex);
      await _localDataSource.saveGroupOrderCarts(groups);
      return Result.success(groups);
    } catch (e) {
      return Result.failed(Formatter.errorMessageCatchException(e.toString()));
    }
  }

  @override
  Future<Result<List<GroupOrderCartModel>>> updateItemsInCartOrderGroup(
      {required OrderCartModel newItem,
      required GroupOrderCartModel groupData}) async {
    try {
      final groups = await _localDataSource.fetchGroupOrderCarts();
      final groupIndex = groups.indexWhere(
          (group) => group.groupOrderCartId == groupData.groupOrderCartId);

      if (groupIndex == -1) {
        return const Result.failed(Formatter.errorMessageDataNotFound);
      }

      final group = groups[groupIndex];
      final items = List<OrderCartModel>.from(group.items);
      final itemIndex =
          items.indexWhere((item) => item.productId == newItem.productId);

      if (itemIndex == -1) {
        return const Result.failed(Formatter.errorMessageDataNotFound);
      }

      items[itemIndex] = newItem;
      groups[groupIndex] =
          group.copyWith(items: items.isNotEmpty ? items : null);

      await _localDataSource.saveGroupOrderCarts(groups);
      return Result.success(groups);
    } catch (e) {
      return Result.failed(Formatter.errorMessageCatchException(e.toString()));
    }
  }

  @override
  Future<Result<List<GroupOrderCartModel>>> removeItemsInCartOrderGroup(
      {required OrderCartModel deleteItem,
      required GroupOrderCartModel groupData}) async {
    try {
      final groups = await _localDataSource.fetchGroupOrderCarts();
      final groupIndex = groups.indexWhere(
          (group) => group.groupOrderCartId == groupData.groupOrderCartId);

      if (groupIndex == -1) {
        return const Result.failed(Formatter.errorMessageDataNotFound);
      }

      final group = groups[groupIndex];
      final items = List<OrderCartModel>.from(group.items);
      final itemIndex =
          items.indexWhere((item) => item.productId == deleteItem.productId);

      if (itemIndex == -1) {
        return const Result.failed(Formatter.errorMessageDataNotFound);
      }

      items.removeAt(itemIndex);
      if (items.isEmpty) {
        groups.removeAt(groupIndex);
      } else {
        groups[groupIndex] = group.copyWith(items: items);
      }

      await _localDataSource.saveGroupOrderCarts(groups);
      return Result.success(groups);
    } catch (e) {
      return Result.failed(Formatter.errorMessageCatchException(e.toString()));
    }
  }
}
