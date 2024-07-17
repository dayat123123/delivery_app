import 'package:freezed_annotation/freezed_annotation.dart';

part 'big_promo_model.freezed.dart';
part 'big_promo_model.g.dart';

@freezed
class BigPromoModel with _$BigPromoModel {
  const factory BigPromoModel(
      {required String idProduct,
      required String namaProduct,
      required double hargaProduct,
      required double discon,
      required int terjual,
      String? imageUrl}) = _BigPromoModel;

  factory BigPromoModel.fromJson(Map<String, dynamic> json) =>
      _$BigPromoModelFromJson(json);
}
