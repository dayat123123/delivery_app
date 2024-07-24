// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_toko_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailTokoModel _$DetailTokoModelFromJson(Map<String, dynamic> json) {
  return _DetailTokoModel.fromJson(json);
}

/// @nodoc
mixin _$DetailTokoModel {
  String get sellerId => throw _privateConstructorUsedError;
  String get sellerName => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get soldProducts => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  List<ProductTokoModel>? get listProduct => throw _privateConstructorUsedError;
  List<CategoriesTokoModel>? get categories =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailTokoModelCopyWith<DetailTokoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailTokoModelCopyWith<$Res> {
  factory $DetailTokoModelCopyWith(
          DetailTokoModel value, $Res Function(DetailTokoModel) then) =
      _$DetailTokoModelCopyWithImpl<$Res, DetailTokoModel>;
  @useResult
  $Res call(
      {String sellerId,
      String sellerName,
      double rating,
      int soldProducts,
      String? imageUrl,
      List<ProductTokoModel>? listProduct,
      List<CategoriesTokoModel>? categories});
}

/// @nodoc
class _$DetailTokoModelCopyWithImpl<$Res, $Val extends DetailTokoModel>
    implements $DetailTokoModelCopyWith<$Res> {
  _$DetailTokoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sellerId = null,
    Object? sellerName = null,
    Object? rating = null,
    Object? soldProducts = null,
    Object? imageUrl = freezed,
    Object? listProduct = freezed,
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      sellerName: null == sellerName
          ? _value.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      soldProducts: null == soldProducts
          ? _value.soldProducts
          : soldProducts // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      listProduct: freezed == listProduct
          ? _value.listProduct
          : listProduct // ignore: cast_nullable_to_non_nullable
              as List<ProductTokoModel>?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoriesTokoModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailTokoModelImplCopyWith<$Res>
    implements $DetailTokoModelCopyWith<$Res> {
  factory _$$DetailTokoModelImplCopyWith(_$DetailTokoModelImpl value,
          $Res Function(_$DetailTokoModelImpl) then) =
      __$$DetailTokoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sellerId,
      String sellerName,
      double rating,
      int soldProducts,
      String? imageUrl,
      List<ProductTokoModel>? listProduct,
      List<CategoriesTokoModel>? categories});
}

/// @nodoc
class __$$DetailTokoModelImplCopyWithImpl<$Res>
    extends _$DetailTokoModelCopyWithImpl<$Res, _$DetailTokoModelImpl>
    implements _$$DetailTokoModelImplCopyWith<$Res> {
  __$$DetailTokoModelImplCopyWithImpl(
      _$DetailTokoModelImpl _value, $Res Function(_$DetailTokoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sellerId = null,
    Object? sellerName = null,
    Object? rating = null,
    Object? soldProducts = null,
    Object? imageUrl = freezed,
    Object? listProduct = freezed,
    Object? categories = freezed,
  }) {
    return _then(_$DetailTokoModelImpl(
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      sellerName: null == sellerName
          ? _value.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      soldProducts: null == soldProducts
          ? _value.soldProducts
          : soldProducts // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      listProduct: freezed == listProduct
          ? _value._listProduct
          : listProduct // ignore: cast_nullable_to_non_nullable
              as List<ProductTokoModel>?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoriesTokoModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailTokoModelImpl implements _DetailTokoModel {
  const _$DetailTokoModelImpl(
      {required this.sellerId,
      required this.sellerName,
      required this.rating,
      required this.soldProducts,
      this.imageUrl,
      final List<ProductTokoModel>? listProduct,
      final List<CategoriesTokoModel>? categories})
      : _listProduct = listProduct,
        _categories = categories;

  factory _$DetailTokoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailTokoModelImplFromJson(json);

  @override
  final String sellerId;
  @override
  final String sellerName;
  @override
  final double rating;
  @override
  final int soldProducts;
  @override
  final String? imageUrl;
  final List<ProductTokoModel>? _listProduct;
  @override
  List<ProductTokoModel>? get listProduct {
    final value = _listProduct;
    if (value == null) return null;
    if (_listProduct is EqualUnmodifiableListView) return _listProduct;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CategoriesTokoModel>? _categories;
  @override
  List<CategoriesTokoModel>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DetailTokoModel(sellerId: $sellerId, sellerName: $sellerName, rating: $rating, soldProducts: $soldProducts, imageUrl: $imageUrl, listProduct: $listProduct, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailTokoModelImpl &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.soldProducts, soldProducts) ||
                other.soldProducts == soldProducts) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality()
                .equals(other._listProduct, _listProduct) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sellerId,
      sellerName,
      rating,
      soldProducts,
      imageUrl,
      const DeepCollectionEquality().hash(_listProduct),
      const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailTokoModelImplCopyWith<_$DetailTokoModelImpl> get copyWith =>
      __$$DetailTokoModelImplCopyWithImpl<_$DetailTokoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailTokoModelImplToJson(
      this,
    );
  }
}

abstract class _DetailTokoModel implements DetailTokoModel {
  const factory _DetailTokoModel(
      {required final String sellerId,
      required final String sellerName,
      required final double rating,
      required final int soldProducts,
      final String? imageUrl,
      final List<ProductTokoModel>? listProduct,
      final List<CategoriesTokoModel>? categories}) = _$DetailTokoModelImpl;

  factory _DetailTokoModel.fromJson(Map<String, dynamic> json) =
      _$DetailTokoModelImpl.fromJson;

  @override
  String get sellerId;
  @override
  String get sellerName;
  @override
  double get rating;
  @override
  int get soldProducts;
  @override
  String? get imageUrl;
  @override
  List<ProductTokoModel>? get listProduct;
  @override
  List<CategoriesTokoModel>? get categories;
  @override
  @JsonKey(ignore: true)
  _$$DetailTokoModelImplCopyWith<_$DetailTokoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
