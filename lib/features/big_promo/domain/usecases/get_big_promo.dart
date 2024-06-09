import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/big_promo/data/big_promo_repositories.dart';
import 'package:delivery_app/features/big_promo/domain/entities/big_promo_model.dart';

class GetBigPromo implements UseCase<Result<List<BigPromoModel>>, void> {
  final BigPromoRepositoriesImpl bigPromoRepositoriesImpl;
  GetBigPromo({required this.bigPromoRepositoriesImpl});
  @override
  Future<Result<List<BigPromoModel>>> call(_) async {
    final result = await bigPromoRepositoriesImpl.getBigpromo();
    if (result is Success) {
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage.toString());
    }
  }
}
