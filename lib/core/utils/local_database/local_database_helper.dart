import 'package:delivery_app/core/utils/local_database/group_cart_model.dart';
import 'package:delivery_app/core/utils/local_database/group_order_cart_model.dart';
import 'package:delivery_app/core/utils/local_database/order_cart_model.dart';
import 'package:delivery_app/injector.dart';
import 'package:delivery_app/shared/misc/local_database_keys.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'cart_model.dart';

Future<void> initStore() async {
  await Hive.initFlutter();
  Hive.registerAdapter(GroupCartModelAdapter());
  Hive.registerAdapter(CartModelAdapter());
  Hive.registerAdapter(GroupOrderCartModelAdapter());
  Hive.registerAdapter(OrderCartModelAdapter());
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
    try {
      if (!Hive.isBoxOpen(name)) {
        box = await Hive.openBox(name);
      } else {
        box = Hive.box(name);
      }
    } catch (e) {
      print("Error opening box: $e");
      await Hive.deleteBoxFromDisk(name);
      try {
        box = await Hive.openBox(name);
      } catch (e) {
        print("Error reopening box: $e");
      }
    }
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

  Future<bool> removeGroupWithMember(String groupCartName) async {
    List<GroupCartModel> groups = List<GroupCartModel>.from(
        box.get(LocalDatabaseKeys.groupWishlish) ?? []);
    if (groups.isEmpty) return false;
    int groupIndex =
        groups.indexWhere((element) => element.groupCartName == groupCartName);
    if (-1 == groupIndex) return false;
    groups.removeAt(groupIndex);
    await box.put(LocalDatabaseKeys.groupWishlish, groups);
    return true;
  }

  //-----------------ORDER CART---------------------//
  Future<List<GroupOrderCartModel>> getAllOrderCart() async {
    List<GroupOrderCartModel> data = List<GroupOrderCartModel>.from(
        box.get(LocalDatabaseKeys.groupOrderCart) ?? []);
    data.removeWhere((element) => element.items?.isEmpty ?? true);
    return data;
  }

  Future<int> getLengthProductInCart() async {
    List<GroupOrderCartModel> groups = List<GroupOrderCartModel>.from(
        box.get(LocalDatabaseKeys.groupOrderCart) ?? []);
    if (groups.isEmpty) {
      return 0;
    } else {
      int total = 0;
      for (var i = 0; i < groups.length; i++) {
        int groupItemLength = groups[i].items?.length ?? 0;
        total += groupItemLength;
      }
      return total;
    }
  }

  Future<bool> createNewOrderGroupCart(
      GroupOrderCartModel newOrderGroupCart) async {
    List<GroupOrderCartModel> groups = List<GroupOrderCartModel>.from(
        box.get(LocalDatabaseKeys.groupOrderCart) ?? []);
    if (groups.isEmpty) {
      groups.insert(0, newOrderGroupCart);
    } else {
      int groupIndex = groups.indexWhere((element) =>
          element.groupOrderCartId == newOrderGroupCart.groupOrderCartId);
      if (groupIndex == -1) {
        groups.insert(0, newOrderGroupCart);
      } else {
        var existingGroupItems = groups[groupIndex].items ?? [];
        var newGroupItems = newOrderGroupCart.items ?? [];
        if (existingGroupItems.isEmpty) {
          groups[groupIndex].items = newOrderGroupCart.items ?? [];
        } else {
          for (int i = 0; i < newGroupItems.length; i++) {
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
      }
    }
    await box.put(LocalDatabaseKeys.groupOrderCart, groups);
    return true;
  }

  Future<bool> removeOrderCartGroup({required String groupCartOrderId}) async {
    List<GroupOrderCartModel> groups = List<GroupOrderCartModel>.from(
        box.get(LocalDatabaseKeys.groupOrderCart) ?? []);
    if (groups.isEmpty) return false;

    int groupIndex = groups
        .indexWhere((element) => element.groupOrderCartId == groupCartOrderId);
    if (-1 == groupIndex) return false;
    groups.removeAt(groupIndex);
    await box.put(LocalDatabaseKeys.groupOrderCart, groups);
    return true;
  }

  Future<bool> updateItemsInCartOrderGroup(
      {required OrderCartModel newItem,
      required GroupOrderCartModel groupData}) async {
    List<GroupOrderCartModel> groups = List<GroupOrderCartModel>.from(
        box.get(LocalDatabaseKeys.groupOrderCart) ?? []);
    if (groups.isEmpty) return false;
    int groupIndex = groups.indexWhere(
        (element) => element.groupOrderCartId == groupData.groupOrderCartId);
    if (-1 == groupIndex) return false;
    final listitems = groups[groupIndex].items ?? [];
    if (listitems.isEmpty) return false;
    int itemIndex = listitems
        .indexWhere((element) => element.productId == newItem.productId);
    if (-1 == itemIndex) return false;
    listitems[itemIndex] = newItem;
    await box.put(LocalDatabaseKeys.groupOrderCart, groups);
    return true;
  }

  Future<bool> removeItemsInCartOrderGroup({
    required OrderCartModel newItem,
    required GroupOrderCartModel groupData,
  }) async {
    List<GroupOrderCartModel> groups = List<GroupOrderCartModel>.from(
      box.get(LocalDatabaseKeys.groupOrderCart) ?? [],
    );

    // Cek apakah grup kosong
    if (groups.isEmpty) return false;

    // Temukan indeks grup yang sesuai
    int groupIndex = groups.indexWhere(
      (element) => element.groupOrderCartId == groupData.groupOrderCartId,
    );
    if (groupIndex == -1) return false;

    // Ambil item dari grup yang ditemukan
    List<OrderCartModel> listitems = groups[groupIndex].items ?? [];

    // Cek apakah item kosong
    if (listitems.isEmpty) return false;

    // Temukan indeks item yang sesuai
    int itemIndex = listitems.indexWhere(
      (element) => element.productId == newItem.productId,
    );
    if (itemIndex == -1) return false;

    // Hapus item dari daftar
    listitems.removeAt(itemIndex);

    // Update grup dengan item yang sudah dihapus
    groups[groupIndex] = groups[groupIndex]
        .copyWith(items: listitems.isNotEmpty ? listitems : null);

    // Simpan data yang diperbarui ke database
    await box.put(LocalDatabaseKeys.groupOrderCart, groups);

    return true;
  }

  Future<void> removeSingleStore(String key) async {
    await box.delete(key);
  }

  Future<void> closeBox() async {
    await box.close();
  }
}
