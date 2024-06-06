import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_category.freezed.dart';
part 'detail_category.g.dart';

@freezed
class DetailCategoryModel with _$DetailCategoryModel {
  const factory DetailCategoryModel(
      {required String idCategory,
      required String nameCateogry,
      required String imageUrl}) = _DetailCategoryModel;

  factory DetailCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$DetailCategoryModelFromJson(json);
}
