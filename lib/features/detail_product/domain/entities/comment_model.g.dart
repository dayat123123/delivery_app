// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentModelImpl _$$CommentModelImplFromJson(Map<String, dynamic> json) =>
    _$CommentModelImpl(
      commentId: json['commentId'] as String,
      isHideAccountId: json['isHideAccountId'] as bool,
      commentAccount: json['commentAccount'] as String,
      commentDesc: json['commentDesc'] as String,
      rating: (json['rating'] as num).toDouble(),
      isHelps: (json['isHelps'] as num).toInt(),
      imageUrlAccount: json['imageUrlAccount'] as String?,
      listFotoComments: (json['listFotoComments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$CommentModelImplToJson(_$CommentModelImpl instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'isHideAccountId': instance.isHideAccountId,
      'commentAccount': instance.commentAccount,
      'commentDesc': instance.commentDesc,
      'rating': instance.rating,
      'isHelps': instance.isHelps,
      'imageUrlAccount': instance.imageUrlAccount,
      'listFotoComments': instance.listFotoComments,
    };
