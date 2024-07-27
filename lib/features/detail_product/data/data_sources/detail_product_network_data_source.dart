import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/detail_product/domain/entities/product_model.dart';

abstract class DetailProductNetworkDataSource {
  Future<Result<DetailProductModel>> fetchDetailProduct(String productId);
}
