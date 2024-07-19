// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'big_promo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BigPromoModelImpl _$$BigPromoModelImplFromJson(Map<String, dynamic> json) =>
    _$BigPromoModelImpl(
      idProduct: json['idProduct'] as String,
      namaProduct: json['namaProduct'] as String,
      sellerName: json['sellerName'] as String,
      hargaProduct: (json['hargaProduct'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      terjual: (json['terjual'] as num).toInt(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$BigPromoModelImplToJson(_$BigPromoModelImpl instance) =>
    <String, dynamic>{
      'idProduct': instance.idProduct,
      'namaProduct': instance.namaProduct,
      'sellerName': instance.sellerName,
      'hargaProduct': instance.hargaProduct,
      'discount': instance.discount,
      'terjual': instance.terjual,
      'imageUrl': instance.imageUrl,
    };
