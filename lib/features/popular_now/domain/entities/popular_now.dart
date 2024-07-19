import 'package:freezed_annotation/freezed_annotation.dart';

part 'popular_now.freezed.dart';
part 'popular_now.g.dart';

@freezed
class PopularNowModel with _$PopularNowModel {
  const factory PopularNowModel(
      {required String idProduct,
      required String namaProduct,
      required String sellerName,
      required double hargaProduct,
      required int jumTerjual,
      required int jumSave,
      required double rating,
      String? imageUrl}) = _PopularNowModel;

  factory PopularNowModel.fromJson(Map<String, dynamic> json) =>
      _$PopularNowModelFromJson(json);
}
