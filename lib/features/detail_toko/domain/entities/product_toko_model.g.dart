// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_toko_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductTokoModelImpl _$$ProductTokoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductTokoModelImpl(
      idProduct: json['idProduct'] as String,
      namaProduct: json['namaProduct'] as String,
      hargaProduct: (json['hargaProduct'] as num).toDouble(),
      jumTerjual: (json['jumTerjual'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$ProductTokoModelImplToJson(
        _$ProductTokoModelImpl instance) =>
    <String, dynamic>{
      'idProduct': instance.idProduct,
      'namaProduct': instance.namaProduct,
      'hargaProduct': instance.hargaProduct,
      'jumTerjual': instance.jumTerjual,
      'rating': instance.rating,
      'discount': instance.discount,
      'imageUrl': instance.imageUrl,
    };
