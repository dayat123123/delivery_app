import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_toko_model.freezed.dart';
part 'product_toko_model.g.dart';

@freezed
class ProductTokoModel with _$ProductTokoModel {
  const factory ProductTokoModel(
      {required String idProduct,
      required String namaProduct,
      required double hargaProduct,
      required int jumTerjual,
      required double rating,
      required double discount,
      String? imageUrl}) = _ProductTokoModel;

  factory ProductTokoModel.fromJson(Map<String, dynamic> json) =>
      _$ProductTokoModelFromJson(json);
}
