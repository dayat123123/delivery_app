// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_toko_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductTokoModel _$ProductTokoModelFromJson(Map<String, dynamic> json) {
  return _ProductTokoModel.fromJson(json);
}

/// @nodoc
mixin _$ProductTokoModel {
  String get idProduct => throw _privateConstructorUsedError;
  String get namaProduct => throw _privateConstructorUsedError;
  double get hargaProduct => throw _privateConstructorUsedError;
  int get jumTerjual => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductTokoModelCopyWith<ProductTokoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductTokoModelCopyWith<$Res> {
  factory $ProductTokoModelCopyWith(
          ProductTokoModel value, $Res Function(ProductTokoModel) then) =
      _$ProductTokoModelCopyWithImpl<$Res, ProductTokoModel>;
  @useResult
  $Res call(
      {String idProduct,
      String namaProduct,
      double hargaProduct,
      int jumTerjual,
      double rating,
      double discount,
      String? imageUrl});
}

/// @nodoc
class _$ProductTokoModelCopyWithImpl<$Res, $Val extends ProductTokoModel>
    implements $ProductTokoModelCopyWith<$Res> {
  _$ProductTokoModelCopyWithImpl(this._value, this._then);

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
    Object? rating = null,
    Object? discount = null,
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
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductTokoModelImplCopyWith<$Res>
    implements $ProductTokoModelCopyWith<$Res> {
  factory _$$ProductTokoModelImplCopyWith(_$ProductTokoModelImpl value,
          $Res Function(_$ProductTokoModelImpl) then) =
      __$$ProductTokoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idProduct,
      String namaProduct,
      double hargaProduct,
      int jumTerjual,
      double rating,
      double discount,
      String? imageUrl});
}

/// @nodoc
class __$$ProductTokoModelImplCopyWithImpl<$Res>
    extends _$ProductTokoModelCopyWithImpl<$Res, _$ProductTokoModelImpl>
    implements _$$ProductTokoModelImplCopyWith<$Res> {
  __$$ProductTokoModelImplCopyWithImpl(_$ProductTokoModelImpl _value,
      $Res Function(_$ProductTokoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idProduct = null,
    Object? namaProduct = null,
    Object? hargaProduct = null,
    Object? jumTerjual = null,
    Object? rating = null,
    Object? discount = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$ProductTokoModelImpl(
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
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
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
class _$ProductTokoModelImpl implements _ProductTokoModel {
  const _$ProductTokoModelImpl(
      {required this.idProduct,
      required this.namaProduct,
      required this.hargaProduct,
      required this.jumTerjual,
      required this.rating,
      required this.discount,
      this.imageUrl});

  factory _$ProductTokoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductTokoModelImplFromJson(json);

  @override
  final String idProduct;
  @override
  final String namaProduct;
  @override
  final double hargaProduct;
  @override
  final int jumTerjual;
  @override
  final double rating;
  @override
  final double discount;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'ProductTokoModel(idProduct: $idProduct, namaProduct: $namaProduct, hargaProduct: $hargaProduct, jumTerjual: $jumTerjual, rating: $rating, discount: $discount, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductTokoModelImpl &&
            (identical(other.idProduct, idProduct) ||
                other.idProduct == idProduct) &&
            (identical(other.namaProduct, namaProduct) ||
                other.namaProduct == namaProduct) &&
            (identical(other.hargaProduct, hargaProduct) ||
                other.hargaProduct == hargaProduct) &&
            (identical(other.jumTerjual, jumTerjual) ||
                other.jumTerjual == jumTerjual) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idProduct, namaProduct,
      hargaProduct, jumTerjual, rating, discount, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductTokoModelImplCopyWith<_$ProductTokoModelImpl> get copyWith =>
      __$$ProductTokoModelImplCopyWithImpl<_$ProductTokoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductTokoModelImplToJson(
      this,
    );
  }
}

abstract class _ProductTokoModel implements ProductTokoModel {
  const factory _ProductTokoModel(
      {required final String idProduct,
      required final String namaProduct,
      required final double hargaProduct,
      required final int jumTerjual,
      required final double rating,
      required final double discount,
      final String? imageUrl}) = _$ProductTokoModelImpl;

  factory _ProductTokoModel.fromJson(Map<String, dynamic> json) =
      _$ProductTokoModelImpl.fromJson;

  @override
  String get idProduct;
  @override
  String get namaProduct;
  @override
  double get hargaProduct;
  @override
  int get jumTerjual;
  @override
  double get rating;
  @override
  double get discount;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$ProductTokoModelImplCopyWith<_$ProductTokoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
