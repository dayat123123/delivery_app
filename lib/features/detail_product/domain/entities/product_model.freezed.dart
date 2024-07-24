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
  String get namaProduct => throw _privateConstructorUsedError;
  String get sellerId => throw _privateConstructorUsedError;
  String get sellerName => throw _privateConstructorUsedError;
  String get addressProduct => throw _privateConstructorUsedError;
  String get categoryProduct => throw _privateConstructorUsedError;
  double get hargaProduct => throw _privateConstructorUsedError;
  int get jumTerjual => throw _privateConstructorUsedError;
  int get jumSave => throw _privateConstructorUsedError;
  int get stockProduct => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get totalReviewers => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  String get numberPhone => throw _privateConstructorUsedError;
  LocationModel get location => throw _privateConstructorUsedError;
  int get estimationTime => throw _privateConstructorUsedError;
  List<CommentModel>? get listComments => throw _privateConstructorUsedError;
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
      String namaProduct,
      String sellerId,
      String sellerName,
      String addressProduct,
      String categoryProduct,
      double hargaProduct,
      int jumTerjual,
      int jumSave,
      int stockProduct,
      double rating,
      int totalReviewers,
      double discount,
      String numberPhone,
      LocationModel location,
      int estimationTime,
      List<CommentModel>? listComments,
      String? imageUrl});

  $LocationModelCopyWith<$Res> get location;
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
    Object? namaProduct = null,
    Object? sellerId = null,
    Object? sellerName = null,
    Object? addressProduct = null,
    Object? categoryProduct = null,
    Object? hargaProduct = null,
    Object? jumTerjual = null,
    Object? jumSave = null,
    Object? stockProduct = null,
    Object? rating = null,
    Object? totalReviewers = null,
    Object? discount = null,
    Object? numberPhone = null,
    Object? location = null,
    Object? estimationTime = null,
    Object? listComments = freezed,
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
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      sellerName: null == sellerName
          ? _value.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      addressProduct: null == addressProduct
          ? _value.addressProduct
          : addressProduct // ignore: cast_nullable_to_non_nullable
              as String,
      categoryProduct: null == categoryProduct
          ? _value.categoryProduct
          : categoryProduct // ignore: cast_nullable_to_non_nullable
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
      stockProduct: null == stockProduct
          ? _value.stockProduct
          : stockProduct // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      totalReviewers: null == totalReviewers
          ? _value.totalReviewers
          : totalReviewers // ignore: cast_nullable_to_non_nullable
              as int,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      numberPhone: null == numberPhone
          ? _value.numberPhone
          : numberPhone // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationModel,
      estimationTime: null == estimationTime
          ? _value.estimationTime
          : estimationTime // ignore: cast_nullable_to_non_nullable
              as int,
      listComments: freezed == listComments
          ? _value.listComments
          : listComments // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationModelCopyWith<$Res> get location {
    return $LocationModelCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
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
      String namaProduct,
      String sellerId,
      String sellerName,
      String addressProduct,
      String categoryProduct,
      double hargaProduct,
      int jumTerjual,
      int jumSave,
      int stockProduct,
      double rating,
      int totalReviewers,
      double discount,
      String numberPhone,
      LocationModel location,
      int estimationTime,
      List<CommentModel>? listComments,
      String? imageUrl});

  @override
  $LocationModelCopyWith<$Res> get location;
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
    Object? namaProduct = null,
    Object? sellerId = null,
    Object? sellerName = null,
    Object? addressProduct = null,
    Object? categoryProduct = null,
    Object? hargaProduct = null,
    Object? jumTerjual = null,
    Object? jumSave = null,
    Object? stockProduct = null,
    Object? rating = null,
    Object? totalReviewers = null,
    Object? discount = null,
    Object? numberPhone = null,
    Object? location = null,
    Object? estimationTime = null,
    Object? listComments = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$DetailProductModelImpl(
      idProduct: null == idProduct
          ? _value.idProduct
          : idProduct // ignore: cast_nullable_to_non_nullable
              as String,
      namaProduct: null == namaProduct
          ? _value.namaProduct
          : namaProduct // ignore: cast_nullable_to_non_nullable
              as String,
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      sellerName: null == sellerName
          ? _value.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      addressProduct: null == addressProduct
          ? _value.addressProduct
          : addressProduct // ignore: cast_nullable_to_non_nullable
              as String,
      categoryProduct: null == categoryProduct
          ? _value.categoryProduct
          : categoryProduct // ignore: cast_nullable_to_non_nullable
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
      stockProduct: null == stockProduct
          ? _value.stockProduct
          : stockProduct // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      totalReviewers: null == totalReviewers
          ? _value.totalReviewers
          : totalReviewers // ignore: cast_nullable_to_non_nullable
              as int,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      numberPhone: null == numberPhone
          ? _value.numberPhone
          : numberPhone // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationModel,
      estimationTime: null == estimationTime
          ? _value.estimationTime
          : estimationTime // ignore: cast_nullable_to_non_nullable
              as int,
      listComments: freezed == listComments
          ? _value._listComments
          : listComments // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>?,
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
      required this.namaProduct,
      required this.sellerId,
      required this.sellerName,
      required this.addressProduct,
      required this.categoryProduct,
      required this.hargaProduct,
      required this.jumTerjual,
      required this.jumSave,
      required this.stockProduct,
      required this.rating,
      required this.totalReviewers,
      required this.discount,
      required this.numberPhone,
      required this.location,
      required this.estimationTime,
      final List<CommentModel>? listComments,
      this.imageUrl})
      : _listComments = listComments;

  factory _$DetailProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailProductModelImplFromJson(json);

  @override
  final String idProduct;
  @override
  final String namaProduct;
  @override
  final String sellerId;
  @override
  final String sellerName;
  @override
  final String addressProduct;
  @override
  final String categoryProduct;
  @override
  final double hargaProduct;
  @override
  final int jumTerjual;
  @override
  final int jumSave;
  @override
  final int stockProduct;
  @override
  final double rating;
  @override
  final int totalReviewers;
  @override
  final double discount;
  @override
  final String numberPhone;
  @override
  final LocationModel location;
  @override
  final int estimationTime;
  final List<CommentModel>? _listComments;
  @override
  List<CommentModel>? get listComments {
    final value = _listComments;
    if (value == null) return null;
    if (_listComments is EqualUnmodifiableListView) return _listComments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'DetailProductModel(idProduct: $idProduct, namaProduct: $namaProduct, sellerId: $sellerId, sellerName: $sellerName, addressProduct: $addressProduct, categoryProduct: $categoryProduct, hargaProduct: $hargaProduct, jumTerjual: $jumTerjual, jumSave: $jumSave, stockProduct: $stockProduct, rating: $rating, totalReviewers: $totalReviewers, discount: $discount, numberPhone: $numberPhone, location: $location, estimationTime: $estimationTime, listComments: $listComments, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailProductModelImpl &&
            (identical(other.idProduct, idProduct) ||
                other.idProduct == idProduct) &&
            (identical(other.namaProduct, namaProduct) ||
                other.namaProduct == namaProduct) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.addressProduct, addressProduct) ||
                other.addressProduct == addressProduct) &&
            (identical(other.categoryProduct, categoryProduct) ||
                other.categoryProduct == categoryProduct) &&
            (identical(other.hargaProduct, hargaProduct) ||
                other.hargaProduct == hargaProduct) &&
            (identical(other.jumTerjual, jumTerjual) ||
                other.jumTerjual == jumTerjual) &&
            (identical(other.jumSave, jumSave) || other.jumSave == jumSave) &&
            (identical(other.stockProduct, stockProduct) ||
                other.stockProduct == stockProduct) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.totalReviewers, totalReviewers) ||
                other.totalReviewers == totalReviewers) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.numberPhone, numberPhone) ||
                other.numberPhone == numberPhone) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.estimationTime, estimationTime) ||
                other.estimationTime == estimationTime) &&
            const DeepCollectionEquality()
                .equals(other._listComments, _listComments) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idProduct,
      namaProduct,
      sellerId,
      sellerName,
      addressProduct,
      categoryProduct,
      hargaProduct,
      jumTerjual,
      jumSave,
      stockProduct,
      rating,
      totalReviewers,
      discount,
      numberPhone,
      location,
      estimationTime,
      const DeepCollectionEquality().hash(_listComments),
      imageUrl);

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
      required final String namaProduct,
      required final String sellerId,
      required final String sellerName,
      required final String addressProduct,
      required final String categoryProduct,
      required final double hargaProduct,
      required final int jumTerjual,
      required final int jumSave,
      required final int stockProduct,
      required final double rating,
      required final int totalReviewers,
      required final double discount,
      required final String numberPhone,
      required final LocationModel location,
      required final int estimationTime,
      final List<CommentModel>? listComments,
      final String? imageUrl}) = _$DetailProductModelImpl;

  factory _DetailProductModel.fromJson(Map<String, dynamic> json) =
      _$DetailProductModelImpl.fromJson;

  @override
  String get idProduct;
  @override
  String get namaProduct;
  @override
  String get sellerId;
  @override
  String get sellerName;
  @override
  String get addressProduct;
  @override
  String get categoryProduct;
  @override
  double get hargaProduct;
  @override
  int get jumTerjual;
  @override
  int get jumSave;
  @override
  int get stockProduct;
  @override
  double get rating;
  @override
  int get totalReviewers;
  @override
  double get discount;
  @override
  String get numberPhone;
  @override
  LocationModel get location;
  @override
  int get estimationTime;
  @override
  List<CommentModel>? get listComments;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$DetailProductModelImplCopyWith<_$DetailProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
