// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailProductModelImpl _$$DetailProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailProductModelImpl(
      idProduct: json['idProduct'] as String,
      categoryProduct: json['categoryProduct'] as String,
      namaProduct: json['namaProduct'] as String,
      hargaProduct: (json['hargaProduct'] as num).toInt(),
      jumTerjual: (json['jumTerjual'] as num).toInt(),
      jumSave: (json['jumSave'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$DetailProductModelImplToJson(
        _$DetailProductModelImpl instance) =>
    <String, dynamic>{
      'idProduct': instance.idProduct,
      'categoryProduct': instance.categoryProduct,
      'namaProduct': instance.namaProduct,
      'hargaProduct': instance.hargaProduct,
      'jumTerjual': instance.jumTerjual,
      'jumSave': instance.jumSave,
      'rating': instance.rating,
      'imageUrl': instance.imageUrl,
    };
