// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailProductModel _$DetailProductModelFromJson(Map<String, dynamic> json) {
  return _DetailProductModel.fromJson(json);
}

/// @nodoc
mixin _$DetailProductModel {
  String get idProduct => throw _privateConstructorUsedError;
  String get categoryProduct => throw _privateConstructorUsedError;
  String get namaProduct => throw _privateConstructorUsedError;
  double get hargaProduct => throw _privateConstructorUsedError;
  int get jumTerjual => throw _privateConstructorUsedError;
  int get jumSave => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailProductModelCopyWith<DetailProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailProductModelCopyWith<$Res> {
  factory $DetailProductModelCopyWith(
          DetailProductModel value, $Res Function(DetailProductModel) then) =
      _$DetailProductModelCopyWithImpl<$Res, DetailProductModel>;
  @useResult
  $Res call(
      {String idProduct,
      String categoryProduct,
      String namaProduct,
      double hargaProduct,
      int jumTerjual,
      int jumSave,
      double rating,
      String? imageUrl});
}

/// @nodoc
class _$DetailProductModelCopyWithImpl<$Res, $Val extends DetailProductModel>
    implements $DetailProductModelCopyWith<$Res> {
  _$DetailProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idProduct = null,
    Object? categoryProduct = null,
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
      categoryProduct: null == categoryProduct
          ? _value.categoryProduct
          : categoryProduct // ignore: cast_nullable_to_non_nullable
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
abstract class _$$DetailProductModelImplCopyWith<$Res>
    implements $DetailProductModelCopyWith<$Res> {
  factory _$$DetailProductModelImplCopyWith(_$DetailProductModelImpl value,
          $Res Function(_$DetailProductModelImpl) then) =
      __$$DetailProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idProduct,
      String categoryProduct,
      String namaProduct,
      double hargaProduct,
      int jumTerjual,
      int jumSave,
      double rating,
      String? imageUrl});
}

/// @nodoc
class __$$DetailProductModelImplCopyWithImpl<$Res>
    extends _$DetailProductModelCopyWithImpl<$Res, _$DetailProductModelImpl>
    implements _$$DetailProductModelImplCopyWith<$Res> {
  __$$DetailProductModelImplCopyWithImpl(_$DetailProductModelImpl _value,
      $Res Function(_$DetailProductModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idProduct = null,
    Object? categoryProduct = null,
    Object? namaProduct = null,
    Object? hargaProduct = null,
    Object? jumTerjual = null,
    Object? jumSave = null,
    Object? rating = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$DetailProductModelImpl(
      idProduct: null == idProduct
          ? _value.idProduct
          : idProduct // ignore: cast_nullable_to_non_nullable
              as String,
      categoryProduct: null == categoryProduct
          ? _value.categoryProduct
          : categoryProduct // ignore: cast_nullable_to_non_nullable
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
class _$DetailProductModelImpl implements _DetailProductModel {
  const _$DetailProductModelImpl(
      {required this.idProduct,
      required this.categoryProduct,
      required this.namaProduct,
      required this.hargaProduct,
      required this.jumTerjual,
      required this.jumSave,
      required this.rating,
      this.imageUrl});

  factory _$DetailProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailProductModelImplFromJson(json);

  @override
  final String idProduct;
  @override
  final String categoryProduct;
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
    return 'DetailProductModel(idProduct: $idProduct, categoryProduct: $categoryProduct, namaProduct: $namaProduct, hargaProduct: $hargaProduct, jumTerjual: $jumTerjual, jumSave: $jumSave, rating: $rating, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailProductModelImpl &&
            (identical(other.idProduct, idProduct) ||
                other.idProduct == idProduct) &&
            (identical(other.categoryProduct, categoryProduct) ||
                other.categoryProduct == categoryProduct) &&
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
  int get hashCode => Object.hash(runtimeType, idProduct, categoryProduct,
      namaProduct, hargaProduct, jumTerjual, jumSave, rating, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailProductModelImplCopyWith<_$DetailProductModelImpl> get copyWith =>
      __$$DetailProductModelImplCopyWithImpl<_$DetailProductModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailProductModelImplToJson(
      this,
    );
  }
}

abstract class _DetailProductModel implements DetailProductModel {
  const factory _DetailProductModel(
      {required final String idProduct,
      required final String categoryProduct,
      required final String namaProduct,
      required final double hargaProduct,
      required final int jumTerjual,
      required final int jumSave,
      required final double rating,
      final String? imageUrl}) = _$DetailProductModelImpl;

  factory _DetailProductModel.fromJson(Map<String, dynamic> json) =
      _$DetailProductModelImpl.fromJson;

  @override
  String get idProduct;
  @override
  String get categoryProduct;
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
  _$$DetailProductModelImplCopyWith<_$DetailProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
