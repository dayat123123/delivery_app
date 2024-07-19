// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'big_promo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BigPromoModel _$BigPromoModelFromJson(Map<String, dynamic> json) {
  return _BigPromoModel.fromJson(json);
}

/// @nodoc
mixin _$BigPromoModel {
  String get idProduct => throw _privateConstructorUsedError;
  String get namaProduct => throw _privateConstructorUsedError;
  String get sellerName => throw _privateConstructorUsedError;
  double get hargaProduct => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  int get terjual => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BigPromoModelCopyWith<BigPromoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BigPromoModelCopyWith<$Res> {
  factory $BigPromoModelCopyWith(
          BigPromoModel value, $Res Function(BigPromoModel) then) =
      _$BigPromoModelCopyWithImpl<$Res, BigPromoModel>;
  @useResult
  $Res call(
      {String idProduct,
      String namaProduct,
      String sellerName,
      double hargaProduct,
      double discount,
      int terjual,
      String? imageUrl});
}

/// @nodoc
class _$BigPromoModelCopyWithImpl<$Res, $Val extends BigPromoModel>
    implements $BigPromoModelCopyWith<$Res> {
  _$BigPromoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idProduct = null,
    Object? namaProduct = null,
    Object? sellerName = null,
    Object? hargaProduct = null,
    Object? discount = null,
    Object? terjual = null,
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
      sellerName: null == sellerName
          ? _value.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      hargaProduct: null == hargaProduct
          ? _value.hargaProduct
          : hargaProduct // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      terjual: null == terjual
          ? _value.terjual
          : terjual // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BigPromoModelImplCopyWith<$Res>
    implements $BigPromoModelCopyWith<$Res> {
  factory _$$BigPromoModelImplCopyWith(
          _$BigPromoModelImpl value, $Res Function(_$BigPromoModelImpl) then) =
      __$$BigPromoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idProduct,
      String namaProduct,
      String sellerName,
      double hargaProduct,
      double discount,
      int terjual,
      String? imageUrl});
}

/// @nodoc
class __$$BigPromoModelImplCopyWithImpl<$Res>
    extends _$BigPromoModelCopyWithImpl<$Res, _$BigPromoModelImpl>
    implements _$$BigPromoModelImplCopyWith<$Res> {
  __$$BigPromoModelImplCopyWithImpl(
      _$BigPromoModelImpl _value, $Res Function(_$BigPromoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idProduct = null,
    Object? namaProduct = null,
    Object? sellerName = null,
    Object? hargaProduct = null,
    Object? discount = null,
    Object? terjual = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$BigPromoModelImpl(
      idProduct: null == idProduct
          ? _value.idProduct
          : idProduct // ignore: cast_nullable_to_non_nullable
              as String,
      namaProduct: null == namaProduct
          ? _value.namaProduct
          : namaProduct // ignore: cast_nullable_to_non_nullable
              as String,
      sellerName: null == sellerName
          ? _value.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      hargaProduct: null == hargaProduct
          ? _value.hargaProduct
          : hargaProduct // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      terjual: null == terjual
          ? _value.terjual
          : terjual // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BigPromoModelImpl implements _BigPromoModel {
  const _$BigPromoModelImpl(
      {required this.idProduct,
      required this.namaProduct,
      required this.sellerName,
      required this.hargaProduct,
      required this.discount,
      required this.terjual,
      this.imageUrl});

  factory _$BigPromoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BigPromoModelImplFromJson(json);

  @override
  final String idProduct;
  @override
  final String namaProduct;
  @override
  final String sellerName;
  @override
  final double hargaProduct;
  @override
  final double discount;
  @override
  final int terjual;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'BigPromoModel(idProduct: $idProduct, namaProduct: $namaProduct, sellerName: $sellerName, hargaProduct: $hargaProduct, discount: $discount, terjual: $terjual, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BigPromoModelImpl &&
            (identical(other.idProduct, idProduct) ||
                other.idProduct == idProduct) &&
            (identical(other.namaProduct, namaProduct) ||
                other.namaProduct == namaProduct) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.hargaProduct, hargaProduct) ||
                other.hargaProduct == hargaProduct) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.terjual, terjual) || other.terjual == terjual) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idProduct, namaProduct,
      sellerName, hargaProduct, discount, terjual, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BigPromoModelImplCopyWith<_$BigPromoModelImpl> get copyWith =>
      __$$BigPromoModelImplCopyWithImpl<_$BigPromoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BigPromoModelImplToJson(
      this,
    );
  }
}

abstract class _BigPromoModel implements BigPromoModel {
  const factory _BigPromoModel(
      {required final String idProduct,
      required final String namaProduct,
      required final String sellerName,
      required final double hargaProduct,
      required final double discount,
      required final int terjual,
      final String? imageUrl}) = _$BigPromoModelImpl;

  factory _BigPromoModel.fromJson(Map<String, dynamic> json) =
      _$BigPromoModelImpl.fromJson;

  @override
  String get idProduct;
  @override
  String get namaProduct;
  @override
  String get sellerName;
  @override
  double get hargaProduct;
  @override
  double get discount;
  @override
  int get terjual;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$BigPromoModelImplCopyWith<_$BigPromoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
