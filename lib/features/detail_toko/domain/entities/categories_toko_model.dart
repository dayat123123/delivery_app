import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_toko_model.freezed.dart';
part 'categories_toko_model.g.dart';

@freezed
class CategoriesTokoModel with _$CategoriesTokoModel {
  const factory CategoriesTokoModel(
      {required String categoriId,
      required String categoriName,
      required int totalProduct}) = _CategoriesTokoModel;

  factory CategoriesTokoModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesTokoModelFromJson(json);
}
