// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommended.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecommendedModelImpl _$$RecommendedModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RecommendedModelImpl(
      idProduct: json['idProduct'] as String,
      namaProduct: json['namaProduct'] as String,
      hargaProduct: (json['hargaProduct'] as num).toInt(),
      jumTerjual: (json['jumTerjual'] as num).toInt(),
      jumSave: (json['jumSave'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$RecommendedModelImplToJson(
        _$RecommendedModelImpl instance) =>
    <String, dynamic>{
      'idProduct': instance.idProduct,
      'namaProduct': instance.namaProduct,
      'hargaProduct': instance.hargaProduct,
      'jumTerjual': instance.jumTerjual,
      'jumSave': instance.jumSave,
      'rating': instance.rating,
      'imageUrl': instance.imageUrl,
    };
