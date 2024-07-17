// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'popular_now.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PopularNowModel _$PopularNowModelFromJson(Map<String, dynamic> json) {
  return _PopularNowModel.fromJson(json);
}

/// @nodoc
mixin _$PopularNowModel {
  String get idProduct => throw _privateConstructorUsedError;
  String get namaProduct => throw _privateConstructorUsedError;
  double get hargaProduct => throw _privateConstructorUsedError;
  int get jumTerjual => throw _privateConstructorUsedError;
  int get jumSave => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PopularNowModelCopyWith<PopularNowModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopularNowModelCopyWith<$Res> {
  factory $PopularNowModelCopyWith(
          PopularNowModel value, $Res Function(PopularNowModel) then) =
      _$PopularNowModelCopyWithImpl<$Res, PopularNowModel>;
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
class _$PopularNowModelCopyWithImpl<$Res, $Val extends PopularNowModel>
    implements $PopularNowModelCopyWith<$Res> {
  _$PopularNowModelCopyWithImpl(this._value, this._then);

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
abstract class _$$PopularNowModelImplCopyWith<$Res>
    implements $PopularNowModelCopyWith<$Res> {
  factory _$$PopularNowModelImplCopyWith(_$PopularNowModelImpl value,
          $Res Function(_$PopularNowModelImpl) then) =
      __$$PopularNowModelImplCopyWithImpl<$Res>;
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
class __$$PopularNowModelImplCopyWithImpl<$Res>
    extends _$PopularNowModelCopyWithImpl<$Res, _$PopularNowModelImpl>
    implements _$$PopularNowModelImplCopyWith<$Res> {
  __$$PopularNowModelImplCopyWithImpl(
      _$PopularNowModelImpl _value, $Res Function(_$PopularNowModelImpl) _then)
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
    return _then(_$PopularNowModelImpl(
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
class _$PopularNowModelImpl implements _PopularNowModel {
  const _$PopularNowModelImpl(
      {required this.idProduct,
      required this.namaProduct,
      required this.hargaProduct,
      required this.jumTerjual,
      required this.jumSave,
      required this.rating,
      this.imageUrl});

  factory _$PopularNowModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PopularNowModelImplFromJson(json);

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
    return 'PopularNowModel(idProduct: $idProduct, namaProduct: $namaProduct, hargaProduct: $hargaProduct, jumTerjual: $jumTerjual, jumSave: $jumSave, rating: $rating, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopularNowModelImpl &&
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
  _$$PopularNowModelImplCopyWith<_$PopularNowModelImpl> get copyWith =>
      __$$PopularNowModelImplCopyWithImpl<_$PopularNowModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PopularNowModelImplToJson(
      this,
    );
  }
}

abstract class _PopularNowModel implements PopularNowModel {
  const factory _PopularNowModel(
      {required final String idProduct,
      required final String namaProduct,
      required final double hargaProduct,
      required final int jumTerjual,
      required final int jumSave,
      required final double rating,
      final String? imageUrl}) = _$PopularNowModelImpl;

  factory _PopularNowModel.fromJson(Map<String, dynamic> json) =
      _$PopularNowModelImpl.fromJson;

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
  _$$PopularNowModelImplCopyWith<_$PopularNowModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
