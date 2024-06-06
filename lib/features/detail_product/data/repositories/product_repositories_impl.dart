import 'dart:io';

import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/detail_product/domain/entities/product_model.dart';

abstract interface class ProductRepositories {
  Future<Result<List<DetailProductModel>>> getProduct(
      {required int limit, required String categoryProduct});
  Future<Result<DetailProductModel>> getProductDetail(
      {required String idProduct});
  Future<Result<void>> addProduct(
      {required String nameProduct,
      required String categoryProduct,
      required int hargaProduct,
      String? imageUrl});
  Future<Result<DetailProductModel>> updateProduct(
      {required String idProduct,
      required String nameProduct,
      required int hargaProduct, //product category not allow to update
      String? imageUrl});
  Future<Result<void>> uploadImageProduct(
      {required String imageUrl,
      required String idProduct,
      required File file});
  Future<Result<void>> deleteProduct({required String idProduct});
}

class ProductRepositoriesImpl implements ProductRepositories {
  @override
  Future<Result<void>> addProduct(
      {required String nameProduct,
      required String categoryProduct,
      required int hargaProduct,
      String? imageUrl}) {
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> deleteProduct({required String idProduct}) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<List<DetailProductModel>>> getProduct(
      {required int limit, required String categoryProduct}) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<DetailProductModel>> getProductDetail(
      {required String idProduct}) async {
    await Future.delayed(Duration(seconds: 3));
    return const Result.success(DetailProductModel(
      idProduct: '1',
      categoryProduct: 'All',
      namaProduct: 'Kacang Kulit',
      hargaProduct: 150000,
      jumTerjual: 100,
      jumSave: 85,
      rating: 4.5,
    ));
  }

  @override
  Future<Result<DetailProductModel>> updateProduct(
      {required String idProduct,
      required String nameProduct,
      required int hargaProduct,
      String? imageUrl}) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> uploadImageProduct(
      {required String imageUrl,
      required String idProduct,
      required File file}) async {
    throw UnimplementedError();
  }
}
