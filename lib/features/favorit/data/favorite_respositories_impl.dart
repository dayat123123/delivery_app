import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/utils/local_database/local_database_helper.dart';
import 'package:delivery_app/features/favorit/domain/entities/cart_model.dart';
import 'package:delivery_app/features/favorit/domain/entities/group_cart_model.dart';
import 'package:delivery_app/shared/misc/formatter.dart';
import 'package:delivery_app/shared/misc/local_database_keys.dart';

abstract interface class FavoriteRespositories {
  Future<Result<List<GroupCartModel>>> getListGroupFavorit();
  Future<Result<List<GroupCartModel>>> createNewGroupFavorit(
      GroupCartModel data);
  Future<Result<List<GroupCartModel>>> removeItemFromGroupFavorit(
      String groupCartName, String productId);
  Future<Result<bool>> addItemtoGroupFavorit(
      String groupCartName, CartModel newItem);
  Future<Result<List<GroupCartModel>>> removeGroupFavorit(String groupCartName);
  Future<Result<List<GroupCartModel>>> editGroupNameFavorit(
      String oldgroupCartName, newgroupCartName);
  Future<Result<bool>> checkItemIsExist(String groupCartName, String productId);
}

class FavoriteRespositoriesImpl implements FavoriteRespositories {
  final DatabaseHelper _databaseHelper;

  FavoriteRespositoriesImpl({required DatabaseHelper databaseHelper})
      : _databaseHelper = databaseHelper;

  @override
  Future<Result<List<GroupCartModel>>> getListGroupFavorit() async {
    try {
      final result = List<GroupCartModel>.from(
          _databaseHelper.box.get(LocalDatabaseKeys.groupWishlish) ?? []);

      return Result.success(result);
    } catch (e) {
      return Result.failed(Formatter.errorMessageCatchException(e.toString()));
    }
  }

  @override
  Future<Result<List<GroupCartModel>>> createNewGroupFavorit(
      GroupCartModel data) async {
    List<GroupCartModel> datalist = List<GroupCartModel>.from(
        _databaseHelper.box.get(LocalDatabaseKeys.groupWishlish) ?? []);
    bool isGroupExist =
        datalist.any((group) => group.groupCartName == data.groupCartName);
    if (isGroupExist) {
      return const Result.failed(Formatter.errorMessageDataIsExist);
    }
    datalist.insert(0, data);
    await _databaseHelper.box.put(LocalDatabaseKeys.groupWishlish, datalist);
    return Result.success(datalist);
  }

  @override
  Future<Result<List<GroupCartModel>>> removeItemFromGroupFavorit(
      String groupCartName, String productId) async {
    final dataList = List<GroupCartModel>.from(
        _databaseHelper.box.get(LocalDatabaseKeys.groupWishlish) ?? []);
    if (dataList.isEmpty) {
      return const Result.failed(Formatter.errorMessageDataEmpty);
    }
    int groupIndex = dataList
        .indexWhere((element) => element.groupCartName == groupCartName);
    if (-1 == groupIndex) {
      return const Result.failed(Formatter.errorMessageDataNotFound);
    }
    int itemIndex = dataList[groupIndex]
        .items
        .indexWhere((element) => element.productId == productId);
    if (-1 == itemIndex) {
      return const Result.failed(Formatter.errorMessageDataNotFound);
    }
    dataList[groupIndex].items.removeAt(itemIndex);
    await _databaseHelper.box.put(LocalDatabaseKeys.groupWishlish, dataList);
    return Result.success(dataList);
  }

  @override
  Future<Result<bool>> addItemtoGroupFavorit(
      String groupCartName, CartModel newItem) async {
    final dataList = List<GroupCartModel>.from(
        _databaseHelper.box.get(LocalDatabaseKeys.groupWishlish) ?? []);
    if (dataList.isEmpty) {
      return const Result.failed(Formatter.errorMessageDataEmpty);
    }
    int groupIndex = dataList
        .indexWhere((element) => element.groupCartName == groupCartName);
    if (groupIndex == -1) {
      return const Result.failed(Formatter.errorMessageDataNotFound);
    }
    int itemIndex = dataList[groupIndex]
        .items
        .indexWhere((element) => element.productId == newItem.productId);
    if (itemIndex != -1) {
      return const Result.failed(Formatter.errorMessageDataIsExist);
    }
    final updatedGroup = dataList[groupIndex]
        .copyWith(items: [newItem, ...dataList[groupIndex].items]);

    final updatedDataList = List<GroupCartModel>.from(dataList)
      ..[groupIndex] = updatedGroup;

    await _databaseHelper.box
        .put(LocalDatabaseKeys.groupWishlish, updatedDataList);
    return const Result.success(true);
  }

  @override
  Future<Result<List<GroupCartModel>>> removeGroupFavorit(
      String groupCartName) async {
    final dataList = List<GroupCartModel>.from(
        _databaseHelper.box.get(LocalDatabaseKeys.groupWishlish) ?? []);
    if (dataList.isEmpty) {
      return const Result.failed(Formatter.errorMessageDataEmpty);
    }
    int groupIndex = dataList
        .indexWhere((element) => element.groupCartName == groupCartName);
    if (-1 == groupIndex) {
      return const Result.failed(Formatter.errorMessageDataNotFound);
    }
    dataList.removeAt(groupIndex);
    await _databaseHelper.box.put(LocalDatabaseKeys.groupWishlish, dataList);
    return Result.success(dataList);
  }

  @override
  Future<Result<List<GroupCartModel>>> editGroupNameFavorit(
      String oldgroupCartName, newgroupCartName) async {
    final dataList = List<GroupCartModel>.from(
        _databaseHelper.box.get(LocalDatabaseKeys.groupWishlish) ?? []);
    if (dataList.isEmpty) {
      return const Result.failed(Formatter.errorMessageDataEmpty);
    }
    int groupIndex = dataList
        .indexWhere((element) => element.groupCartName == oldgroupCartName);
    if (-1 == groupIndex) {
      return const Result.failed(Formatter.errorMessageDataNotFound);
    }
    GroupCartModel updatedData =
        dataList[groupIndex].copyWith(groupCartName: newgroupCartName);
    dataList[groupIndex] = updatedData;
    await _databaseHelper.box.put(LocalDatabaseKeys.groupWishlish, dataList);
    return Result.success(dataList);
  }

  @override
  Future<Result<bool>> checkItemIsExist(
      String groupCartName, String productId) async {
    final dataList = List<GroupCartModel>.from(
        _databaseHelper.box.get(LocalDatabaseKeys.groupWishlish) ?? []);
    if (dataList.isEmpty) {
      return const Result.failed(Formatter.errorMessageDataEmpty);
    }
    int groupIndex = dataList
        .indexWhere((element) => element.groupCartName == groupCartName);
    if (-1 == groupIndex) {
      return const Result.failed(Formatter.errorMessageDataNotFound);
    }
    int itemIndex = (dataList[groupIndex].items)
        .indexWhere((element) => element.productId == productId);
    if (-1 == itemIndex)
      return const Result.failed(Formatter.errorMessageDataNotFound);
    return const Result.success(true);
  }
}
