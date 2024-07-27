import 'package:hive/hive.dart';

part 'order_cart_model.g.dart';

@HiveType(typeId: 4)
class OrderCartModel {
  @HiveField(1)
  final String productId;

  @HiveField(2)
  final String productName;

  @HiveField(3)
  final String? productImage;

  @HiveField(4)
  final double productPrice;

  @HiveField(5)
  final int quantity;

  OrderCartModel({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.quantity,
    this.productImage,
  });

  OrderCartModel copyWith({
    String? productId,
    String? productName,
    String? productImage,
    double? productPrice,
    int? quantity,
  }) {
    return OrderCartModel(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productImage: productImage ?? this.productImage,
      productPrice: productPrice ?? this.productPrice,
      quantity: quantity ?? this.quantity,
    );
  }

  bool isChange(OrderCartModel other) {
    return productId != other.productId ||
        productName != other.productName ||
        productImage != other.productImage ||
        productPrice != other.productPrice ||
        quantity != other.quantity;
  }
}
