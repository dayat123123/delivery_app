// lib/features/cart_order/data/datasources/cart_order_local_data_source_impl.dart

import 'package:delivery_app/core/utils/local_database/local_database_helper.dart';
import 'package:delivery_app/features/cart_order/data/data_sources/cart_order_local_data_source.dart';
import 'package:delivery_app/features/cart_order/domain/entities/group_order_cart_model.dart';
import 'package:delivery_app/shared/misc/local_database_keys.dart';

class CartOrderLocalDataSourceImpl implements CartOrderLocalDataSource {
  final DatabaseHelper _databaseHelper;

  CartOrderLocalDataSourceImpl(this._databaseHelper);

  @override
  Future<List<GroupOrderCartModel>> fetchGroupOrderCarts() async {
    final data = List<GroupOrderCartModel>.from(
        _databaseHelper.box.get(LocalDatabaseKeys.groupOrderCart) ?? []);
    return data;
  }

  @override
  Future<void> saveGroupOrderCarts(List<GroupOrderCartModel> carts) async {
    await _databaseHelper.box.put(LocalDatabaseKeys.groupOrderCart, carts);
  }
}
