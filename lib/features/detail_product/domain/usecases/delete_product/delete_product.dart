import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/detail_product/data/repositories/product_repositories_impl.dart';

class DeleteProduct implements UseCase<Result<void>, String> {
  final ProductRepositoriesImpl networkProductRepositories;
  DeleteProduct({required this.networkProductRepositories});
  @override
  Future<Result<void>> call(String params) async {
    return await networkProductRepositories.deleteProduct(idProduct: params);
  }
}
