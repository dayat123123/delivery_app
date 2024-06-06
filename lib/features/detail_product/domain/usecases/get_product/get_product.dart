import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/detail_product/data/repositories/product_repositories_impl.dart';
import 'package:delivery_app/features/detail_product/domain/entities/product_model.dart';
import 'package:delivery_app/features/detail_product/domain/usecases/get_product/get_product_params.dart';

class GetProduct
    implements UseCase<Result<List<DetailProductModel>>, GetProductParams> {
  final ProductRepositoriesImpl networkProductRepositories;
  GetProduct({required this.networkProductRepositories});
  @override
  Future<Result<List<DetailProductModel>>> call(GetProductParams params) async {
    var resultList = await networkProductRepositories.getProduct(
        limit: params.limit, categoryProduct: params.categoryProduct);
    if (resultList is Success) {
      return Result.success(resultList.resultValue!);
    } else {
      return Result.failed(resultList.errorMessage.toString());
    }
  }
}
