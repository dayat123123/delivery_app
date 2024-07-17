// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommended.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecommendedModel _$RecommendedModelFromJson(Map<String, dynamic> json) {
  return _RecommendedModel.fromJson(json);
}

/// @nodoc
mixin _$RecommendedModel {
  String get idProduct => throw _privateConstructorUsedError;
  String get namaProduct => throw _privateConstructorUsedError;
  double get hargaProduct => throw _privateConstructorUsedError;
  int get jumTerjual => throw _privateConstructorUsedError;
  int get jumSave => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecommendedModelCopyWith<RecommendedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendedModelCopyWith<$Res> {
  factory $RecommendedModelCopyWith(
          RecommendedModel value, $Res Function(RecommendedModel) then) =
      _$RecommendedModelCopyWithImpl<$Res, RecommendedModel>;
  @useResult
  $Res call(
      {String idProduct,
      String namaProduct,
      double hargaProduct,
      int jumTerjual,
      int jumSave,
      double rating,
      String? imageUrl});
}

/// @nodoc
class _$RecommendedModelCopyWithImpl<$Res, $Val extends RecommendedModel>
    implements $RecommendedModelCopyWith<$Res> {
  _$RecommendedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idProduct = null,
    Object? namaProduct = null,
    Object? hargaProduct = null,
    Object? jumTerjual = null,
    Object? jumSave = null,
    Object? rating = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      idProduct: null == idProduct
          ? _value.idProduct
          : idProduct // ignore: cast_nullable_to_non_nullable
              as String,
      namaProduct: null == namaProduct
          ? _value.namaProduct
          : namaProduct // ignore: cast_nullable_to_non_nullable
              as String,
      hargaProduct: null == hargaProduct
          ? _value.hargaProduct
          : hargaProduct // ignore: cast_nullable_to_non_nullable
              as double,
      jumTerjual: null == jumTerjual
          ? _value.jumTerjual
          : jumTerjual // ignore: cast_nullable_to_non_nullable
              as int,
      jumSave: null == jumSave
          ? _value.jumSave
          : jumSave // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecommendedModelImplCopyWith<$Res>
    implements $RecommendedModelCopyWith<$Res> {
  factory _$$RecommendedModelImplCopyWith(_$RecommendedModelImpl value,
          $Res Function(_$RecommendedModelImpl) then) =
      __$$RecommendedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idProduct,
      String namaProduct,
      double hargaProduct,
      int jumTerjual,
      int jumSave,
      double rating,
      String? imageUrl});
}

/// @nodoc
class __$$RecommendedModelImplCopyWithImpl<$Res>
    extends _$RecommendedModelCopyWithImpl<$Res, _$RecommendedModelImpl>
    implements _$$RecommendedModelImplCopyWith<$Res> {
  __$$RecommendedModelImplCopyWithImpl(_$RecommendedModelImpl _value,
      $Res Function(_$RecommendedModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idProduct = null,
    Object? namaProduct = null,
    Object? hargaProduct = null,
    Object? jumTerjual = null,
    Object? jumSave = null,
    Object? rating = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$RecommendedModelImpl(
      idProduct: null == idProduct
          ? _value.idProduct
          : idProduct // ignore: cast_nullable_to_non_nullable
              as String,
      namaProduct: null == namaProduct
          ? _value.namaProduct
          : namaProduct // ignore: cast_nullable_to_non_nullable
              as String,
      hargaProduct: null == hargaProduct
          ? _value.hargaProduct
          : hargaProduct // ignore: cast_nullable_to_non_nullable
              as double,
      jumTerjual: null == jumTerjual
          ? _value.jumTerjual
          : jumTerjual // ignore: cast_nullable_to_non_nullable
              as int,
      jumSave: null == jumSave
          ? _value.jumSave
          : jumSave // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendedModelImpl implements _RecommendedModel {
  const _$RecommendedModelImpl(
      {required this.idProduct,
      required this.namaProduct,
      required this.hargaProduct,
      required this.jumTerjual,
      required this.jumSave,
      required this.rating,
      this.imageUrl});

  factory _$RecommendedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendedModelImplFromJson(json);

  @override
  final String idProduct;
  @override
  final String namaProduct;
  @override
  final double hargaProduct;
  @override
  final int jumTerjual;
  @override
  final int jumSave;
  @override
  final double rating;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'RecommendedModel(idProduct: $idProduct, namaProduct: $namaProduct, hargaProduct: $hargaProduct, jumTerjual: $jumTerjual, jumSave: $jumSave, rating: $rating, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendedModelImpl &&
            (identical(other.idProduct, idProduct) ||
                other.idProduct == idProduct) &&
            (identical(other.namaProduct, namaProduct) ||
                other.namaProduct == namaProduct) &&
            (identical(other.hargaProduct, hargaProduct) ||
                other.hargaProduct == hargaProduct) &&
            (identical(other.jumTerjual, jumTerjual) ||
                other.jumTerjual == jumTerjual) &&
            (identical(other.jumSave, jumSave) || other.jumSave == jumSave) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idProduct, namaProduct,
      hargaProduct, jumTerjual, jumSave, rating, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendedModelImplCopyWith<_$RecommendedModelImpl> get copyWith =>
      __$$RecommendedModelImplCopyWithImpl<_$RecommendedModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendedModelImplToJson(
      this,
    );
  }
}

abstract class _RecommendedModel implements RecommendedModel {
  const factory _RecommendedModel(
      {required final String idProduct,
      required final String namaProduct,
      required final double hargaProduct,
      required final int jumTerjual,
      required final int jumSave,
      required final double rating,
      final String? imageUrl}) = _$RecommendedModelImpl;

  factory _RecommendedModel.fromJson(Map<String, dynamic> json) =
      _$RecommendedModelImpl.fromJson;

  @override
  String get idProduct;
  @override
  String get namaProduct;
  @override
  double get hargaProduct;
  @override
  int get jumTerjual;
  @override
  int get jumSave;
  @override
  double get rating;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$RecommendedModelImplCopyWith<_$RecommendedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
