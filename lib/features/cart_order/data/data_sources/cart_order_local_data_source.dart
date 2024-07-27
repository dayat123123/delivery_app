import 'package:delivery_app/features/cart_order/domain/entities/group_order_cart_model.dart';

abstract class CartOrderLocalDataSource {
  Future<List<GroupOrderCartModel>> fetchGroupOrderCarts();
  Future<void> saveGroupOrderCarts(List<GroupOrderCartModel> carts);
}
