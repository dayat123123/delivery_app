import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/detail_product/domain/entities/product_model.dart';
import 'package:delivery_app/features/detail_product/domain/repositories/detail_product_repository.dart';

class GetProductDetailUseCase
    implements UseCase<Result<DetailProductModel>, String> {
  final DetailProductRepository _repository;
  GetProductDetailUseCase(this._repository);
  @override
  Future<Result<DetailProductModel>> call(String productId) {
    return _repository.getDetailProduct(productId);
  }
}
