import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/popular_now/data/popular_now_repositories.dart';
import 'package:delivery_app/features/popular_now/domain/entities/popular_now.dart';

class GetPopularNow implements UseCase<Result<List<PopularNowModel>>, void> {
  final PopularNowRepositoriesImpl popularNowRepositoriesImpl;
  GetPopularNow({required this.popularNowRepositoriesImpl});
  @override
  Future<Result<List<PopularNowModel>>> call(_) async {
    final resultlist = await popularNowRepositoriesImpl.getPolularnow();
    if (resultlist is Success) {
      return Result.success(resultlist.resultValue!);
    } else {
      return Result.failed(resultlist.errorMessage.toString());
    }
  }
}
