// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return _CommentModel.fromJson(json);
}

/// @nodoc
mixin _$CommentModel {
  String get commentId => throw _privateConstructorUsedError;
  bool get isHideAccountId => throw _privateConstructorUsedError;
  String get commentAccount => throw _privateConstructorUsedError;
  String get commentDesc => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get isHelps => throw _privateConstructorUsedError;
  String? get imageUrlAccount => throw _privateConstructorUsedError;
  List<String>? get listFotoComments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentModelCopyWith<CommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentModelCopyWith<$Res> {
  factory $CommentModelCopyWith(
          CommentModel value, $Res Function(CommentModel) then) =
      _$CommentModelCopyWithImpl<$Res, CommentModel>;
  @useResult
  $Res call(
      {String commentId,
      bool isHideAccountId,
      String commentAccount,
      String commentDesc,
      double rating,
      int isHelps,
      String? imageUrlAccount,
      List<String>? listFotoComments});
}

/// @nodoc
class _$CommentModelCopyWithImpl<$Res, $Val extends CommentModel>
    implements $CommentModelCopyWith<$Res> {
  _$CommentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
    Object? isHideAccountId = null,
    Object? commentAccount = null,
    Object? commentDesc = null,
    Object? rating = null,
    Object? isHelps = null,
    Object? imageUrlAccount = freezed,
    Object? listFotoComments = freezed,
  }) {
    return _then(_value.copyWith(
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      isHideAccountId: null == isHideAccountId
          ? _value.isHideAccountId
          : isHideAccountId // ignore: cast_nullable_to_non_nullable
              as bool,
      commentAccount: null == commentAccount
          ? _value.commentAccount
          : commentAccount // ignore: cast_nullable_to_non_nullable
              as String,
      commentDesc: null == commentDesc
          ? _value.commentDesc
          : commentDesc // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      isHelps: null == isHelps
          ? _value.isHelps
          : isHelps // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrlAccount: freezed == imageUrlAccount
          ? _value.imageUrlAccount
          : imageUrlAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      listFotoComments: freezed == listFotoComments
          ? _value.listFotoComments
          : listFotoComments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentModelImplCopyWith<$Res>
    implements $CommentModelCopyWith<$Res> {
  factory _$$CommentModelImplCopyWith(
          _$CommentModelImpl value, $Res Function(_$CommentModelImpl) then) =
      __$$CommentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String commentId,
      bool isHideAccountId,
      String commentAccount,
      String commentDesc,
      double rating,
      int isHelps,
      String? imageUrlAccount,
      List<String>? listFotoComments});
}

/// @nodoc
class __$$CommentModelImplCopyWithImpl<$Res>
    extends _$CommentModelCopyWithImpl<$Res, _$CommentModelImpl>
    implements _$$CommentModelImplCopyWith<$Res> {
  __$$CommentModelImplCopyWithImpl(
      _$CommentModelImpl _value, $Res Function(_$CommentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
    Object? isHideAccountId = null,
    Object? commentAccount = null,
    Object? commentDesc = null,
    Object? rating = null,
    Object? isHelps = null,
    Object? imageUrlAccount = freezed,
    Object? listFotoComments = freezed,
  }) {
    return _then(_$CommentModelImpl(
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      isHideAccountId: null == isHideAccountId
          ? _value.isHideAccountId
          : isHideAccountId // ignore: cast_nullable_to_non_nullable
              as bool,
      commentAccount: null == commentAccount
          ? _value.commentAccount
          : commentAccount // ignore: cast_nullable_to_non_nullable
              as String,
      commentDesc: null == commentDesc
          ? _value.commentDesc
          : commentDesc // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      isHelps: null == isHelps
          ? _value.isHelps
          : isHelps // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrlAccount: freezed == imageUrlAccount
          ? _value.imageUrlAccount
          : imageUrlAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      listFotoComments: freezed == listFotoComments
          ? _value._listFotoComments
          : listFotoComments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentModelImpl implements _CommentModel {
  const _$CommentModelImpl(
      {required this.commentId,
      required this.isHideAccountId,
      required this.commentAccount,
      required this.commentDesc,
      required this.rating,
      required this.isHelps,
      this.imageUrlAccount,
      final List<String>? listFotoComments})
      : _listFotoComments = listFotoComments;

  factory _$CommentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentModelImplFromJson(json);

  @override
  final String commentId;
  @override
  final bool isHideAccountId;
  @override
  final String commentAccount;
  @override
  final String commentDesc;
  @override
  final double rating;
  @override
  final int isHelps;
  @override
  final String? imageUrlAccount;
  final List<String>? _listFotoComments;
  @override
  List<String>? get listFotoComments {
    final value = _listFotoComments;
    if (value == null) return null;
    if (_listFotoComments is EqualUnmodifiableListView)
      return _listFotoComments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CommentModel(commentId: $commentId, isHideAccountId: $isHideAccountId, commentAccount: $commentAccount, commentDesc: $commentDesc, rating: $rating, isHelps: $isHelps, imageUrlAccount: $imageUrlAccount, listFotoComments: $listFotoComments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentModelImpl &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.isHideAccountId, isHideAccountId) ||
                other.isHideAccountId == isHideAccountId) &&
            (identical(other.commentAccount, commentAccount) ||
                other.commentAccount == commentAccount) &&
            (identical(other.commentDesc, commentDesc) ||
                other.commentDesc == commentDesc) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.isHelps, isHelps) || other.isHelps == isHelps) &&
            (identical(other.imageUrlAccount, imageUrlAccount) ||
                other.imageUrlAccount == imageUrlAccount) &&
            const DeepCollectionEquality()
                .equals(other._listFotoComments, _listFotoComments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      commentId,
      isHideAccountId,
      commentAccount,
      commentDesc,
      rating,
      isHelps,
      imageUrlAccount,
      const DeepCollectionEquality().hash(_listFotoComments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentModelImplCopyWith<_$CommentModelImpl> get copyWith =>
      __$$CommentModelImplCopyWithImpl<_$CommentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentModelImplToJson(
      this,
    );
  }
}

abstract class _CommentModel implements CommentModel {
  const factory _CommentModel(
      {required final String commentId,
      required final bool isHideAccountId,
      required final String commentAccount,
      required final String commentDesc,
      required final double rating,
      required final int isHelps,
      final String? imageUrlAccount,
      final List<String>? listFotoComments}) = _$CommentModelImpl;

  factory _CommentModel.fromJson(Map<String, dynamic> json) =
      _$CommentModelImpl.fromJson;

  @override
  String get commentId;
  @override
  bool get isHideAccountId;
  @override
  String get commentAccount;
  @override
  String get commentDesc;
  @override
  double get rating;
  @override
  int get isHelps;
  @override
  String? get imageUrlAccount;
  @override
  List<String>? get listFotoComments;
  @override
  @JsonKey(ignore: true)
  _$$CommentModelImplCopyWith<_$CommentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
