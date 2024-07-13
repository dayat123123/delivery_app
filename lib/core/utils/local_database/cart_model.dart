import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 1)
class CartModel {
  @HiveField(1)
  final String productId;

  @HiveField(2)
  final String productName;

  @HiveField(3)
  final String productDeskripsi;

  @HiveField(4)
  final String productImage;

  @HiveField(5)
  final String productVolume;

  @HiveField(6)
  final String productPriceSaved;

  @HiveField(7)
  final String productJumlahBeli;

  @HiveField(8)
  final String productWeight;

  CartModel(
      this.productId,
      this.productName,
      this.productDeskripsi,
      this.productImage,
      this.productVolume,
      this.productPriceSaved,
      this.productJumlahBeli,
      this.productWeight);
}
