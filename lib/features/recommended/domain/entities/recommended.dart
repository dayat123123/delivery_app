import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommended.freezed.dart';
part 'recommended.g.dart';

@freezed
class RecommendedModel with _$RecommendedModel {
  const factory RecommendedModel(
      {required String idProduct,
      required String namaProduct,
      required double hargaProduct,
      required int jumTerjual,
      required int jumSave,
      required double rating,
      String? imageUrl}) = _RecommendedModel;

  factory RecommendedModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendedModelFromJson(json);
}
