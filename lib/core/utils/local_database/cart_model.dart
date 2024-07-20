import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 1)
class CartModel {
  @HiveField(1)
  final String productId;

  @HiveField(2)
  final String productName;

  @HiveField(3)
  final String? productImage;

  @HiveField(4)
  final double productPrice;

  CartModel(
      {required this.productId,
      required this.productName,
      required this.productPrice,
      this.productImage});
}
