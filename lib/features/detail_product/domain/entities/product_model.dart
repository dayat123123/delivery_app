import 'package:delivery_app/core/utils/location/location_model.dart';
import 'package:delivery_app/features/detail_product/domain/entities/comment_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class DetailProductModel with _$DetailProductModel {
  const factory DetailProductModel({
    required String idProduct,
    required String namaProduct,
    required String sellerId,
    required String sellerName,
    required String addressProduct,
    required String categoryProduct,
    required double hargaProduct,
    required int jumTerjual,
    required int jumSave,
    required int stockProduct,
    required double rating,
    required int totalReviewers,
    required double discount,
    required String numberPhone,
    required LocationModel location,
    required int estimationTime,
    List<CommentModel>? listComments,
    String? imageUrl,
  }) = _DetailProductModel;

  factory DetailProductModel.fromJson(Map<String, dynamic> json) =>
      _$DetailProductModelFromJson(json);
}
