import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';

import 'package:delivery_app/features/recommended/data/get_recommended_repositories.dart';
import 'package:delivery_app/features/recommended/domain/entities/recommended.dart';

class GetRecommended implements UseCase<Result<List<RecommendedModel>>, void> {
  final RecommendedRepositories recommendedRepositories;
  GetRecommended({required this.recommendedRepositories});
  @override
  Future<Result<List<RecommendedModel>>> call(_) async {
    final resultlist = await recommendedRepositories.getRecommended();
    if (resultlist is Success) {
      return Result.success(resultlist.resultValue!);
    } else {
      return Result.failed(resultlist.errorMessage.toString());
    }
  }
}
