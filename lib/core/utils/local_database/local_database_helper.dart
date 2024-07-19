import 'package:delivery_app/core/utils/local_database/group_cart_model.dart';
import 'package:delivery_app/injector.dart';
import 'package:delivery_app/shared/misc/local_database_keys.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'cart_model.dart';

Future<void> initStore() async {
  await Hive.initFlutter();
  Hive.registerAdapter(GroupCartModelAdapter());
  Hive.registerAdapter(CartModelAdapter());
}

Future<void> openStore() async {
  final store = inject.get<DatabaseHelper>();
  store.openBox(LocalDatabaseKeys.cartModelBox);
}

class DatabaseHelper {
  late Box box;

  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<void> openBox(String name) async {
    box = await Hive.openBox(name);
  }

  //---------------Favorite Product Local-----------------//
  Future<List<GroupCartModel>> getAllGroupFavorit() async {
    return List<GroupCartModel>.from(
        box.get(LocalDatabaseKeys.groupWishlish) ?? []);
  }

  Future<List<CartModel>> getSingleGroupFavorit(String groupCartName) async {
    List<GroupCartModel> groups = List<GroupCartModel>.from(
        box.get(LocalDatabaseKeys.groupWishlish) ?? []);
    if (groups.isEmpty) return [];
    int groupIndex =
        groups.indexWhere((element) => element.groupCartName == groupCartName);
    if (groupIndex == -1) return [];
    return groups[groupIndex].items ?? [];
  }

  Future<CartModel?> getSingleDataFromGroupFavorit(
    String groupCartName,
    String checkItemId,
  ) async {
    List<GroupCartModel> groups = List<GroupCartModel>.from(
        box.get(LocalDatabaseKeys.groupWishlish) ?? []);
    if (groups.isEmpty) return null;

    int groupIndex =
        groups.indexWhere((element) => element.groupCartName == groupCartName);
    if (groupIndex == -1) return null;
    if (groups[groupIndex].items == null ||
        (groups[groupIndex].items?.isEmpty ?? true)) return null;
    int itemIndex = groups[groupIndex]
        .items!
        .indexWhere((element) => element.productId == checkItemId);
    if (itemIndex == -1) return null;
    return groups[groupIndex].items?[itemIndex];
  }

  Future<bool> createNewGroupFavorit(GroupCartModel newGroupCart,
      {List<CartModel>? listData}) async {
    List<GroupCartModel> groups = List<GroupCartModel>.from(
        box.get(LocalDatabaseKeys.groupWishlish) ?? []);
    bool isGroupExist = groups
        .any((group) => group.groupCartName == newGroupCart.groupCartName);
    if (isGroupExist) return false;
    if (listData != null) {
      newGroupCart.items = listData;
    }
    groups.insert(0, newGroupCart);
    await box.put(LocalDatabaseKeys.groupWishlish, groups);
    return true;
  }

  Future<bool> checkIfItemIsExists(
      {required String groupCartName, required String checkItemId}) async {
    List<GroupCartModel> groups = List<GroupCartModel>.from(
        box.get(LocalDatabaseKeys.groupWishlish) ?? []);
    if (groups.isEmpty) return false;
    int groupIndex =
        groups.indexWhere((element) => element.groupCartName == groupCartName);
    if (-1 == groupIndex) return false;
    if (groups[groupIndex].items == null ||
        (groups[groupIndex].items?.isEmpty ?? true)) return false;
    int itemIndex = (groups[groupIndex].items ?? [])
        .indexWhere((element) => element.productId == checkItemId);
    if (-1 == itemIndex) return false;
    return true;
  }

  Future<void> removeItemFromGroupCart(
      String groupCartName, String productId) async {
    List<GroupCartModel> groups = List<GroupCartModel>.from(
        box.get(LocalDatabaseKeys.groupWishlish) ?? []);
    if (groups.isEmpty) return;
    int groupIndex =
        groups.indexWhere((element) => element.groupCartName == groupCartName);
    if (-1 == groupIndex) return;
    if (groups[groupIndex].items == null ||
        (groups[groupIndex].items?.isEmpty ?? true)) return;
    int itemIndex = (groups[groupIndex].items ?? [])
        .indexWhere((element) => element.productId == productId);
    if (-1 == itemIndex) return;
    groups[groupIndex].items?.removeAt(itemIndex);
    await box.put(LocalDatabaseKeys.groupWishlish, groups);
  }

  Future<bool> addItemToGroupCart(
      String groupCartName, CartModel newItem) async {
    List<GroupCartModel> groups = List<GroupCartModel>.from(
        box.get(LocalDatabaseKeys.groupWishlish) ?? []);
    if (groups.isEmpty) return false;
    int groupIndex =
        groups.indexWhere((element) => element.groupCartName == groupCartName);
    if (-1 == groupIndex) return false;
    if (groups[groupIndex].items == null ||
        (groups[groupIndex].items?.isEmpty ?? true)) {
      groups[groupIndex].items = [newItem];
      await box.put(LocalDatabaseKeys.groupWishlish, groups);
      return true;
    }
    int itemIndex = (groups[groupIndex].items ?? [])
        .indexWhere((element) => element.productId == newItem.productId);
    if (-1 != itemIndex) return false;
    groups[groupIndex].items?.insert(0, newItem);
    await box.put(LocalDatabaseKeys.groupWishlish, groups);
    return true;
  }

  Future<void> removeGroupWithMember(String groupCartName) async {
    List<GroupCartModel> groups = List<GroupCartModel>.from(
        box.get(LocalDatabaseKeys.groupWishlish) ?? []);
    if (groups.isEmpty) return;
    int groupIndex =
        groups.indexWhere((element) => element.groupCartName == groupCartName);
    if (-1 == groupIndex) return;
    groups.removeAt(groupIndex);
    await box.put(LocalDatabaseKeys.groupWishlish, groups);
  }

  Future<void> removeSingleStore(String key) async {
    await box.delete(key);
  }

  Future<void> closeBox() async {
    await box.close();
  }
}
