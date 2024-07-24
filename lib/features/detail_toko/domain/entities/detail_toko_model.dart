import 'package:delivery_app/features/detail_toko/domain/entities/categories_toko_model.dart';
import 'package:delivery_app/features/detail_toko/domain/entities/product_toko_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_toko_model.freezed.dart';
part 'detail_toko_model.g.dart';

@freezed
class DetailTokoModel with _$DetailTokoModel {
  const factory DetailTokoModel(
      {required String sellerId,
      required String sellerName,
      required double rating,
      required int soldProducts,
      String? imageUrl,
      List<ProductTokoModel>? listProduct,
      List<CategoriesTokoModel>? categories}) = _DetailTokoModel;

  factory DetailTokoModel.fromJson(Map<String, dynamic> json) =>
      _$DetailTokoModelFromJson(json);
}
