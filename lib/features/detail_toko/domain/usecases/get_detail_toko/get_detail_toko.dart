import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/detail_toko/data/repositories/detail_toko_repositories_impl.dart';
import 'package:delivery_app/features/detail_toko/domain/entities/detail_toko_model.dart';

class GetDetailToko implements UseCase<Result<DetailTokoModel>, String> {
  final DetailTokoRepositoriesImpl detailTokoRepositoriesImpl;
  GetDetailToko({required this.detailTokoRepositoriesImpl});

  @override
  Future<Result<DetailTokoModel>> call(String sellerId) async {
    var result =
        await detailTokoRepositoriesImpl.getDetailToko(sellerId: sellerId);
    if (result is Success) {
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage.toString());
    }
  }
}
