// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_toko_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoriesTokoModel _$CategoriesTokoModelFromJson(Map<String, dynamic> json) {
  return _CategoriesTokoModel.fromJson(json);
}

/// @nodoc
mixin _$CategoriesTokoModel {
  String get categoriId => throw _privateConstructorUsedError;
  String get categoriName => throw _privateConstructorUsedError;
  int get totalProduct => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoriesTokoModelCopyWith<CategoriesTokoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesTokoModelCopyWith<$Res> {
  factory $CategoriesTokoModelCopyWith(
          CategoriesTokoModel value, $Res Function(CategoriesTokoModel) then) =
      _$CategoriesTokoModelCopyWithImpl<$Res, CategoriesTokoModel>;
  @useResult
  $Res call({String categoriId, String categoriName, int totalProduct});
}

/// @nodoc
class _$CategoriesTokoModelCopyWithImpl<$Res, $Val extends CategoriesTokoModel>
    implements $CategoriesTokoModelCopyWith<$Res> {
  _$CategoriesTokoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoriId = null,
    Object? categoriName = null,
    Object? totalProduct = null,
  }) {
    return _then(_value.copyWith(
      categoriId: null == categoriId
          ? _value.categoriId
          : categoriId // ignore: cast_nullable_to_non_nullable
              as String,
      categoriName: null == categoriName
          ? _value.categoriName
          : categoriName // ignore: cast_nullable_to_non_nullable
              as String,
      totalProduct: null == totalProduct
          ? _value.totalProduct
          : totalProduct // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoriesTokoModelImplCopyWith<$Res>
    implements $CategoriesTokoModelCopyWith<$Res> {
  factory _$$CategoriesTokoModelImplCopyWith(_$CategoriesTokoModelImpl value,
          $Res Function(_$CategoriesTokoModelImpl) then) =
      __$$CategoriesTokoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String categoriId, String categoriName, int totalProduct});
}

/// @nodoc
class __$$CategoriesTokoModelImplCopyWithImpl<$Res>
    extends _$CategoriesTokoModelCopyWithImpl<$Res, _$CategoriesTokoModelImpl>
    implements _$$CategoriesTokoModelImplCopyWith<$Res> {
  __$$CategoriesTokoModelImplCopyWithImpl(_$CategoriesTokoModelImpl _value,
      $Res Function(_$CategoriesTokoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoriId = null,
    Object? categoriName = null,
    Object? totalProduct = null,
  }) {
    return _then(_$CategoriesTokoModelImpl(
      categoriId: null == categoriId
          ? _value.categoriId
          : categoriId // ignore: cast_nullable_to_non_nullable
              as String,
      categoriName: null == categoriName
          ? _value.categoriName
          : categoriName // ignore: cast_nullable_to_non_nullable
              as String,
      totalProduct: null == totalProduct
          ? _value.totalProduct
          : totalProduct // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoriesTokoModelImpl implements _CategoriesTokoModel {
  const _$CategoriesTokoModelImpl(
      {required this.categoriId,
      required this.categoriName,
      required this.totalProduct});

  factory _$CategoriesTokoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoriesTokoModelImplFromJson(json);

  @override
  final String categoriId;
  @override
  final String categoriName;
  @override
  final int totalProduct;

  @override
  String toString() {
    return 'CategoriesTokoModel(categoriId: $categoriId, categoriName: $categoriName, totalProduct: $totalProduct)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesTokoModelImpl &&
            (identical(other.categoriId, categoriId) ||
                other.categoriId == categoriId) &&
            (identical(other.categoriName, categoriName) ||
                other.categoriName == categoriName) &&
            (identical(other.totalProduct, totalProduct) ||
                other.totalProduct == totalProduct));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, categoriId, categoriName, totalProduct);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesTokoModelImplCopyWith<_$CategoriesTokoModelImpl> get copyWith =>
      __$$CategoriesTokoModelImplCopyWithImpl<_$CategoriesTokoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoriesTokoModelImplToJson(
      this,
    );
  }
}

abstract class _CategoriesTokoModel implements CategoriesTokoModel {
  const factory _CategoriesTokoModel(
      {required final String categoriId,
      required final String categoriName,
      required final int totalProduct}) = _$CategoriesTokoModelImpl;

  factory _CategoriesTokoModel.fromJson(Map<String, dynamic> json) =
      _$CategoriesTokoModelImpl.fromJson;

  @override
  String get categoriId;
  @override
  String get categoriName;
  @override
  int get totalProduct;
  @override
  @JsonKey(ignore: true)
  _$$CategoriesTokoModelImplCopyWith<_$CategoriesTokoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
