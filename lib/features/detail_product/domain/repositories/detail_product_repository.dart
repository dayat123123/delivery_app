import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/detail_product/data/data_sources/detail_product_network_data_source.dart';
import 'package:delivery_app/features/detail_product/domain/entities/product_model.dart';

abstract interface class DetailProductRepository {
  Future<Result<DetailProductModel>> getDetailProduct(String productId);
}

class DetailProductRepositoryImpl implements DetailProductRepository {
  final DetailProductNetworkDataSource _dataSource;

  DetailProductRepositoryImpl(this._dataSource);
  @override
  Future<Result<DetailProductModel>> getDetailProduct(String productId) async {
    return _dataSource.fetchDetailProduct(productId);
  }
}
