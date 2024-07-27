import 'package:delivery_app/features/wishlish/domain/entities/group_cart_model.dart';
import 'package:delivery_app/features/cart_order/domain/entities/group_order_cart_model.dart';
import 'package:delivery_app/features/cart_order/domain/entities/order_cart_model.dart';
import 'package:delivery_app/injector.dart';
import 'package:delivery_app/shared/misc/local_database_keys.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../features/wishlish/domain/entities/cart_model.dart';

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

  Future<void> removeSingleStore(String key) async {
    await box.delete(key);
  }

  Future<void> closeBox() async {
    await box.close();
  }
}
