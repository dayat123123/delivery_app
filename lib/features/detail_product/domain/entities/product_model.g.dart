// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailProductModelImpl _$$DetailProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailProductModelImpl(
      idProduct: json['idProduct'] as String,
      namaProduct: json['namaProduct'] as String,
      sellerId: json['sellerId'] as String,
      sellerName: json['sellerName'] as String,
      addressProduct: json['addressProduct'] as String,
      categoryProduct: json['categoryProduct'] as String,
      hargaProduct: (json['hargaProduct'] as num).toDouble(),
      jumTerjual: (json['jumTerjual'] as num).toInt(),
      jumSave: (json['jumSave'] as num).toInt(),
      stockProduct: (json['stockProduct'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      totalReviewers: (json['totalReviewers'] as num).toInt(),
      discount: (json['discount'] as num).toDouble(),
      numberPhone: json['numberPhone'] as String,
      location:
          LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      estimationTime: (json['estimationTime'] as num).toInt(),
      listComments: (json['listComments'] as List<dynamic>?)
          ?.map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$DetailProductModelImplToJson(
        _$DetailProductModelImpl instance) =>
    <String, dynamic>{
      'idProduct': instance.idProduct,
      'namaProduct': instance.namaProduct,
      'sellerId': instance.sellerId,
      'sellerName': instance.sellerName,
      'addressProduct': instance.addressProduct,
      'categoryProduct': instance.categoryProduct,
      'hargaProduct': instance.hargaProduct,
      'jumTerjual': instance.jumTerjual,
      'jumSave': instance.jumSave,
      'stockProduct': instance.stockProduct,
      'rating': instance.rating,
      'totalReviewers': instance.totalReviewers,
      'discount': instance.discount,
      'numberPhone': instance.numberPhone,
      'location': instance.location,
      'estimationTime': instance.estimationTime,
      'listComments': instance.listComments,
      'imageUrl': instance.imageUrl,
    };
