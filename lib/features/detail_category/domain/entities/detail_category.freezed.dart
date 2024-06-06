// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailCategoryModel _$DetailCategoryModelFromJson(Map<String, dynamic> json) {
  return _DetailCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$DetailCategoryModel {
  String get idCategory => throw _privateConstructorUsedError;
  String get nameCateogry => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailCategoryModelCopyWith<DetailCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCategoryModelCopyWith<$Res> {
  factory $DetailCategoryModelCopyWith(
          DetailCategoryModel value, $Res Function(DetailCategoryModel) then) =
      _$DetailCategoryModelCopyWithImpl<$Res, DetailCategoryModel>;
  @useResult
  $Res call({String idCategory, String nameCateogry, String imageUrl});
}

/// @nodoc
class _$DetailCategoryModelCopyWithImpl<$Res, $Val extends DetailCategoryModel>
    implements $DetailCategoryModelCopyWith<$Res> {
  _$DetailCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCategory = null,
    Object? nameCateogry = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      idCategory: null == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as String,
      nameCateogry: null == nameCateogry
          ? _value.nameCateogry
          : nameCateogry // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailCategoryModelImplCopyWith<$Res>
    implements $DetailCategoryModelCopyWith<$Res> {
  factory _$$DetailCategoryModelImplCopyWith(_$DetailCategoryModelImpl value,
          $Res Function(_$DetailCategoryModelImpl) then) =
      __$$DetailCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idCategory, String nameCateogry, String imageUrl});
}

/// @nodoc
class __$$DetailCategoryModelImplCopyWithImpl<$Res>
    extends _$DetailCategoryModelCopyWithImpl<$Res, _$DetailCategoryModelImpl>
    implements _$$DetailCategoryModelImplCopyWith<$Res> {
  __$$DetailCategoryModelImplCopyWithImpl(_$DetailCategoryModelImpl _value,
      $Res Function(_$DetailCategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCategory = null,
    Object? nameCateogry = null,
    Object? imageUrl = null,
  }) {
    return _then(_$DetailCategoryModelImpl(
      idCategory: null == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as String,
      nameCateogry: null == nameCateogry
          ? _value.nameCateogry
          : nameCateogry // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailCategoryModelImpl implements _DetailCategoryModel {
  const _$DetailCategoryModelImpl(
      {required this.idCategory,
      required this.nameCateogry,
      required this.imageUrl});

  factory _$DetailCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailCategoryModelImplFromJson(json);

  @override
  final String idCategory;
  @override
  final String nameCateogry;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'DetailCategoryModel(idCategory: $idCategory, nameCateogry: $nameCateogry, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailCategoryModelImpl &&
            (identical(other.idCategory, idCategory) ||
                other.idCategory == idCategory) &&
            (identical(other.nameCateogry, nameCateogry) ||
                other.nameCateogry == nameCateogry) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idCategory, nameCateogry, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailCategoryModelImplCopyWith<_$DetailCategoryModelImpl> get copyWith =>
      __$$DetailCategoryModelImplCopyWithImpl<_$DetailCategoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _DetailCategoryModel implements DetailCategoryModel {
  const factory _DetailCategoryModel(
      {required final String idCategory,
      required final String nameCateogry,
      required final String imageUrl}) = _$DetailCategoryModelImpl;

  factory _DetailCategoryModel.fromJson(Map<String, dynamic> json) =
      _$DetailCategoryModelImpl.fromJson;

  @override
  String get idCategory;
  @override
  String get nameCateogry;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$DetailCategoryModelImplCopyWith<_$DetailCategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
