import 'package:delivery_app/features/cart_order/domain/entities/group_order_cart_model.dart';
import 'package:delivery_app/features/cart_order/domain/entities/order_cart_model.dart';

class OrderCartAndGroupCartParam {
  final OrderCartModel orderCartModel;
  final GroupOrderCartModel groupOrderCartModel;

  OrderCartAndGroupCartParam(
      {required this.orderCartModel, required this.groupOrderCartModel});
}
