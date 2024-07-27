import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/wishlish/data/data_sources/favorite_local_data_source.dart';
import 'package:delivery_app/features/wishlish/domain/entities/cart_model.dart';
import 'package:delivery_app/features/wishlish/domain/entities/group_cart_model.dart';
import 'package:delivery_app/shared/misc/formatter.dart';

abstract interface class FavoriteRepository {
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

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteLocalDataSource _localDataSource;

  FavoriteRepositoryImpl(this._localDataSource);

  @override
  Future<Result<bool>> addItemtoGroupFavorit(
      String groupCartName, CartModel newItem) async {
    try {
      List<GroupCartModel> dataList =
          await _localDataSource.fetchGroupFavorite();
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

      await _localDataSource.saveGroupFavorite(updatedDataList);
      return const Result.success(true);
    } catch (e) {
      return Result.failed(Formatter.errorMessageCatchException(e.toString()));
    }
  }

  @override
  Future<Result<bool>> checkItemIsExist(
      String groupCartName, String productId) async {
    try {
      List<GroupCartModel> dataList =
          await _localDataSource.fetchGroupFavorite();
      if (dataList.isEmpty) {
        return const Result.failed(Formatter.errorMessageDataEmpty);
      }
      int groupIndex = dataList
          .indexWhere((element) => element.groupCartName == groupCartName);
      if (groupIndex == -1) {
        return const Result.failed(Formatter.errorMessageDataNotFound);
      }
      int itemIndex = (dataList[groupIndex].items)
          .indexWhere((element) => element.productId == productId);
      if (itemIndex == -1) {
        return const Result.failed(Formatter.errorMessageDataNotFound);
      }
      return const Result.success(true);
    } catch (e) {
      return Result.failed(Formatter.errorMessageCatchException(e.toString()));
    }
  }

  @override
  Future<Result<List<GroupCartModel>>> createNewGroupFavorit(
      GroupCartModel data) async {
    try {
      List<GroupCartModel> datalist =
          await _localDataSource.fetchGroupFavorite();
      bool isGroupExist =
          datalist.any((group) => group.groupCartName == data.groupCartName);
      if (isGroupExist) {
        return const Result.failed(Formatter.errorMessageDataIsExist);
      }
      datalist.insert(0, data);
      await _localDataSource.saveGroupFavorite(datalist);
      return Result.success(datalist);
    } catch (e) {
      return Result.failed(Formatter.errorMessageCatchException(e.toString()));
    }
  }

  @override
  Future<Result<List<GroupCartModel>>> editGroupNameFavorit(
      String oldgroupCartName, newgroupCartName) async {
    try {
      List<GroupCartModel> dataList =
          await _localDataSource.fetchGroupFavorite();
      if (dataList.isEmpty) {
        return const Result.failed(Formatter.errorMessageDataEmpty);
      }
      int groupIndex = dataList
          .indexWhere((element) => element.groupCartName == oldgroupCartName);
      if (groupIndex == -1) {
        return const Result.failed(Formatter.errorMessageDataNotFound);
      }
      GroupCartModel updatedData =
          dataList[groupIndex].copyWith(groupCartName: newgroupCartName);
      dataList[groupIndex] = updatedData;
      await _localDataSource.saveGroupFavorite(dataList);
      return Result.success(dataList);
    } catch (e) {
      return Result.failed(Formatter.errorMessageCatchException(e.toString()));
    }
  }

  @override
  Future<Result<List<GroupCartModel>>> getListGroupFavorit() async {
    try {
      final favorites = await _localDataSource.fetchGroupFavorite();
      return Result.success(favorites);
    } catch (e) {
      return Result.failed(Formatter.errorMessageCatchException(e.toString()));
    }
  }

  @override
  Future<Result<List<GroupCartModel>>> removeGroupFavorit(
      String groupCartName) async {
    try {
      List<GroupCartModel> dataList =
          await _localDataSource.fetchGroupFavorite();
      if (dataList.isEmpty) {
        return const Result.failed(Formatter.errorMessageDataEmpty);
      }
      int groupIndex = dataList
          .indexWhere((element) => element.groupCartName == groupCartName);
      if (groupIndex == -1) {
        return const Result.failed(Formatter.errorMessageDataNotFound);
      }
      dataList.removeAt(groupIndex);
      await _localDataSource.saveGroupFavorite(dataList);
      return Result.success(dataList);
    } catch (e) {
      return Result.failed(Formatter.errorMessageCatchException(e.toString()));
    }
  }

  @override
  Future<Result<List<GroupCartModel>>> removeItemFromGroupFavorit(
      String groupCartName, String productId) async {
    List<GroupCartModel> dataList = await _localDataSource.fetchGroupFavorite();
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
    await _localDataSource.saveGroupFavorite(dataList);
    return Result.success(dataList);
  }
}
