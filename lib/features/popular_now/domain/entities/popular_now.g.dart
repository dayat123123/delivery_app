// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_now.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PopularNowModelImpl _$$PopularNowModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PopularNowModelImpl(
      idProduct: json['idProduct'] as String,
      namaProduct: json['namaProduct'] as String,
      sellerName: json['sellerName'] as String,
      hargaProduct: (json['hargaProduct'] as num).toDouble(),
      jumTerjual: (json['jumTerjual'] as num).toInt(),
      jumSave: (json['jumSave'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$PopularNowModelImplToJson(
        _$PopularNowModelImpl instance) =>
    <String, dynamic>{
      'idProduct': instance.idProduct,
      'namaProduct': instance.namaProduct,
      'sellerName': instance.sellerName,
      'hargaProduct': instance.hargaProduct,
      'jumTerjual': instance.jumTerjual,
      'jumSave': instance.jumSave,
      'rating': instance.rating,
      'imageUrl': instance.imageUrl,
    };
