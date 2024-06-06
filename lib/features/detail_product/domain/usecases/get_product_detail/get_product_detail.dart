import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/detail_product/data/repositories/product_repositories_impl.dart';
import 'package:delivery_app/features/detail_product/domain/entities/product_model.dart';

class GetProductDetail implements UseCase<Result<DetailProductModel>, String> {
  final ProductRepositoriesImpl networkProductRepositories;
  GetProductDetail({required this.networkProductRepositories});
  @override
  Future<Result<DetailProductModel>> call(String params) async {
    var result =
        await networkProductRepositories.getProductDetail(idProduct: params);
    if (result is Success) {
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage.toString());
    }
  }
}
