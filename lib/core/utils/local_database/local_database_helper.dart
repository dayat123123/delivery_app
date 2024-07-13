import 'package:hive_flutter/hive_flutter.dart';

Future<void> initStore() async {
  await Hive.initFlutter();
}

class LocalDatabaseHelper {
  late Box box;
  static final LocalDatabaseHelper _instance = LocalDatabaseHelper._internal();

  factory LocalDatabaseHelper() {
    return _instance;
  }

  LocalDatabaseHelper._internal();

  Future<void> openBox(String name) async {
    box = await Hive.openBox(name);
  }

  // Create or Update
  Future<void> putData(String key, dynamic value) async {
    await box.put(key, value);
  }

  // Read
  dynamic getData(String key) {
    return box.get(key);
  }

  // Delete
  Future<void> deleteData(String key) async {
    await box.delete(key);
  }

  // Check if key exists
  bool containsKey(String key) {
    return box.containsKey(key);
  }

  // Get all keys
  List<dynamic> getAllKeys() {
    return box.keys.toList();
  }

  // Get all values
  List<dynamic> getAllValues() {
    return box.values.toList();
  }

  // Close the box
  Future<void> closeBox() async {
    await box.close();
  }
}
