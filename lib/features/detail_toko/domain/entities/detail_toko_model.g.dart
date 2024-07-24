// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_toko_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailTokoModelImpl _$$DetailTokoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailTokoModelImpl(
      sellerId: json['sellerId'] as String,
      sellerName: json['sellerName'] as String,
      rating: (json['rating'] as num).toDouble(),
      soldProducts: (json['soldProducts'] as num).toInt(),
      imageUrl: json['imageUrl'] as String?,
      listProduct: (json['listProduct'] as List<dynamic>?)
          ?.map((e) => ProductTokoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoriesTokoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DetailTokoModelImplToJson(
        _$DetailTokoModelImpl instance) =>
    <String, dynamic>{
      'sellerId': instance.sellerId,
      'sellerName': instance.sellerName,
      'rating': instance.rating,
      'soldProducts': instance.soldProducts,
      'imageUrl': instance.imageUrl,
      'listProduct': instance.listProduct,
      'categories': instance.categories,
    };
