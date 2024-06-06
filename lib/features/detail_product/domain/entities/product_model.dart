import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class DetailProductModel with _$DetailProductModel {
  const factory DetailProductModel({
    required String idProduct,
    required String categoryProduct,
    required String namaProduct,
    required int hargaProduct,
    required int jumTerjual,
    required int jumSave,
    required double rating,
    String? imageUrl,
  }) = _DetailProductModel;

  factory DetailProductModel.fromJson(Map<String, dynamic> json) =>
      _$DetailProductModelFromJson(json);
}
