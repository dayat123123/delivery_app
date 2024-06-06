import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/detail_product/data/repositories/product_repositories_impl.dart';
import 'package:delivery_app/features/detail_product/domain/entities/product_model.dart';
import 'package:delivery_app/features/detail_product/domain/usecases/update_product/update_product_params.dart';

class UpdateProduct
    implements UseCase<Result<DetailProductModel>, UpdateProductParams> {
  final ProductRepositoriesImpl networkProductRepositories;
  UpdateProduct({required this.networkProductRepositories});
  @override
  Future<Result<DetailProductModel>> call(UpdateProductParams params) async {
    final putData = await networkProductRepositories.updateProduct(
        idProduct: params.idProduct,
        nameProduct: params.nameProduct,
        hargaProduct: params.hargaProduct,
        imageUrl: params.imageUrl);
    if (putData is Success) {
      return Result.success(putData.resultValue!);
    } else {
      return Result.failed(putData.errorMessage.toString());
    }
  }
}
