// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_toko_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoriesTokoModelImpl _$$CategoriesTokoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoriesTokoModelImpl(
      categoriId: json['categoriId'] as String,
      categoriName: json['categoriName'] as String,
      totalProduct: (json['totalProduct'] as num).toInt(),
    );

Map<String, dynamic> _$$CategoriesTokoModelImplToJson(
        _$CategoriesTokoModelImpl instance) =>
    <String, dynamic>{
      'categoriId': instance.categoriId,
      'categoriName': instance.categoriName,
      'totalProduct': instance.totalProduct,
    };
