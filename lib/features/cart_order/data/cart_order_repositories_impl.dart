import 'dart:async';

import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/utils/local_database/local_database_helper.dart';
import 'package:delivery_app/features/cart_order/domain/entities/group_order_cart_model.dart';
import 'package:delivery_app/features/cart_order/domain/entities/order_cart_model.dart';
import 'package:delivery_app/shared/misc/formatter.dart';
import 'package:delivery_app/shared/misc/local_database_keys.dart';

abstract interface class CartOrderRepositories {
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
      {required OrderCartModel newItem,
      required GroupOrderCartModel groupData});
}

class CartOrderRepositoriesImpl implements CartOrderRepositories {
  final DatabaseHelper _databaseHelper;

  CartOrderRepositoriesImpl({required DatabaseHelper databaseHelper})
      : _databaseHelper = databaseHelper;
  @override
  Future<Result<List<GroupOrderCartModel>>> getListOrderCart() async {
    List<GroupOrderCartModel> data = List<GroupOrderCartModel>.from(
        _databaseHelper.box.get(LocalDatabaseKeys.groupOrderCart) ?? [])
      ..removeWhere((element) => element.items.isEmpty);
    if (data.isEmpty) {
      return const Result.failed(Formatter.errorMessageDataEmpty);
    }
    return Result.success(data);
  }

  @override
  Future<Result<int>> getTotalProductInOrderCart() async {
    List<GroupOrderCartModel> groups = List<GroupOrderCartModel>.from(
        _databaseHelper.box.get(LocalDatabaseKeys.groupOrderCart) ?? []);
    int totalData = 0;
    for (var i = 0; i < groups.length; i++) {
      int groupItemLength = groups[i].items.length;
      totalData += groupItemLength;
    }
    return Result.success(totalData);
  }

  @override
  Future<Result<List<GroupOrderCartModel>>> createNewGroupOrderCart(
      GroupOrderCartModel newOrderGroupCar) async {
    List<GroupOrderCartModel> groups = List<GroupOrderCartModel>.from(
        _databaseHelper.box.get(LocalDatabaseKeys.groupOrderCart) ?? []);
    if (groups.isEmpty) {
      groups.insert(0, newOrderGroupCar);
      return Result.success(groups);
    }
    int groupIndex = groups.indexWhere((element) =>
        element.groupOrderCartId == newOrderGroupCar.groupOrderCartId);
    if (-1 == groupIndex) {
      groups.insert(0, newOrderGroupCar);
      return Result.success(groups);
    }
    var existingGroupItems = groups[groupIndex].items;
    var newGroupItems = newOrderGroupCar.items;
    if (existingGroupItems.isEmpty) {
      groups[groupIndex].items = newGroupItems;
    } else {
      for (var i = 0; i < newGroupItems.length; i++) {
        int productIndex = existingGroupItems.indexWhere(
            (element) => element.productId == newGroupItems[i].productId);
        if (productIndex == -1) {
          existingGroupItems.insert(0, newGroupItems[i]);
        } else {
          OrderCartModel updatedData = existingGroupItems[productIndex]
              .copyWith(
                  quantity: existingGroupItems[productIndex].quantity +
                      newGroupItems[i].quantity,
                  productPrice: newGroupItems[i].productPrice,
                  productImage: newGroupItems[i].productImage);
          existingGroupItems[productIndex] = updatedData;
        }
      }
    }
    await _databaseHelper.box.put(LocalDatabaseKeys.groupOrderCart, groups);
    return Result.success(groups);
  }

  @override
  Future<Result<List<GroupOrderCartModel>>> removeGroupOrderCart(
      String groupCartOrderId) async {
    List<GroupOrderCartModel> groups = List<GroupOrderCartModel>.from(
        _databaseHelper.box.get(LocalDatabaseKeys.groupOrderCart) ?? []);
    if (groups.isEmpty) {
      return const Result.failed(Formatter.errorMessageDataNotFound);
    }
    int groupIndex = groups
        .indexWhere((element) => element.groupOrderCartId == groupCartOrderId);
    if (-1 == groupIndex) {
      return const Result.failed(Formatter.errorMessageDataNotFound);
    }
    groups.removeAt(groupIndex);
    await _databaseHelper.box.put(LocalDatabaseKeys.groupOrderCart, groups);
    return Result.success(groups);
  }

  @override
  Future<Result<List<GroupOrderCartModel>>> updateItemsInCartOrderGroup(
      {required OrderCartModel newItem,
      required GroupOrderCartModel groupData}) async {
    List<GroupOrderCartModel> groups = List<GroupOrderCartModel>.from(
        _databaseHelper.box.get(LocalDatabaseKeys.groupOrderCart) ?? []);
    if (groups.isEmpty) {
      return const Result.failed(Formatter.errorMessageDataEmpty);
    }

    int groupIndex = groups.indexWhere(
        (element) => element.groupOrderCartId == groupData.groupOrderCartId);
    if (-1 == groupIndex) {
      return const Result.failed(Formatter.errorMessageDataNotFound);
    }
    final listitems = groups[groupIndex].items;
    if (listitems.isEmpty) {
      return const Result.failed(Formatter.errorMessageDataEmpty);
    }
    int itemIndex = listitems
        .indexWhere((element) => element.productId == newItem.productId);
    if (-1 == itemIndex) {
      return const Result.failed(Formatter.errorMessageDataNotFound);
    }
    listitems[itemIndex] = newItem;
    await _databaseHelper.box.put(LocalDatabaseKeys.groupOrderCart, groups);
    return Result.success(groups);
  }

  @override
  Future<Result<List<GroupOrderCartModel>>> removeItemsInCartOrderGroup(
      {required OrderCartModel newItem,
      required GroupOrderCartModel groupData}) async {
    List<GroupOrderCartModel> groups = List<GroupOrderCartModel>.from(
        _databaseHelper.box.get(LocalDatabaseKeys.groupOrderCart) ?? []);
    if (groups.isEmpty) {
      return const Result.failed(Formatter.errorMessageDataEmpty);
    }

    int groupIndex = groups.indexWhere(
        (element) => element.groupOrderCartId == groupData.groupOrderCartId);
    if (-1 == groupIndex) {
      return const Result.failed(Formatter.errorMessageDataNotFound);
    }
    final listitems = groups[groupIndex].items;
    if (listitems.isEmpty) {
      return const Result.failed(Formatter.errorMessageDataEmpty);
    }
    int itemIndex = listitems
        .indexWhere((element) => element.productId == newItem.productId);
    if (-1 == itemIndex) {
      return const Result.failed(Formatter.errorMessageDataNotFound);
    }
    listitems.removeAt(itemIndex);
    groups[groupIndex] = groups[groupIndex]
        .copyWith(items: listitems.isNotEmpty ? listitems : null);

    await _databaseHelper.box.put(LocalDatabaseKeys.groupOrderCart, groups);
    return Result.success(groups);
  }
}
