import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/detail_product/data/repositories/product_repositories_impl.dart';
import 'package:delivery_app/features/detail_product/domain/usecases/upload_image_product/upload_image_product_params.dart';

class UploadImageProduct
    implements UseCase<Result<void>, UploadImageProductParams> {
  final ProductRepositoriesImpl networkProductRepositories;
  UploadImageProduct({required this.networkProductRepositories});
  @override
  Future<Result<void>> call(UploadImageProductParams params) async {
    return await networkProductRepositories.uploadImageProduct(
        file: params.file,
        imageUrl: params.filePath,
        idProduct: params.idProduct);
  }
}
