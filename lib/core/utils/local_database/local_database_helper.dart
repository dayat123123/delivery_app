import 'package:delivery_app/features/favorit/domain/entities/group_cart_model.dart';
import 'package:delivery_app/features/cart_order/domain/entities/group_order_cart_model.dart';
import 'package:delivery_app/features/cart_order/domain/entities/order_cart_model.dart';
import 'package:delivery_app/injector.dart';
import 'package:delivery_app/shared/misc/local_database_keys.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../features/favorit/domain/entities/cart_model.dart';

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
      // await Hive.deleteBoxFromDisk(name);
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

    if (groups.isEmpty) return false;

    int groupIndex = groups.indexWhere(
      (element) => element.groupOrderCartId == groupData.groupOrderCartId,
    );
    if (groupIndex == -1) return false;

    List<OrderCartModel> listitems = groups[groupIndex].items ?? [];

    if (listitems.isEmpty) return false;

    int itemIndex = listitems.indexWhere(
      (element) => element.productId == newItem.productId,
    );
    if (itemIndex == -1) return false;

    listitems.removeAt(itemIndex);

    groups[groupIndex] = groups[groupIndex]
        .copyWith(items: listitems.isNotEmpty ? listitems : null);

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
