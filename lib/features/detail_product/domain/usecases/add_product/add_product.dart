import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/detail_product/data/repositories/product_repositories_impl.dart';
import 'package:delivery_app/features/detail_product/domain/usecases/add_product/add_product_params.dart';

class AddProduct implements UseCase<Result<void>, AddProductParams> {
  final ProductRepositoriesImpl networkProductRepositories;
  AddProduct({required this.networkProductRepositories});
  @override
  Future<Result<void>> call(AddProductParams params) async {
    return await networkProductRepositories.addProduct(
        nameProduct: params.nameProduct,
        categoryProduct: params.categoryProduct,
        hargaProduct: params.hargaProduct);
  }
}
