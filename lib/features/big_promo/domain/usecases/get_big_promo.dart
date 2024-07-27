import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/big_promo/domain/entities/big_promo_model.dart';
import 'package:delivery_app/features/big_promo/domain/repositories/big_promo_repository.dart';

class GetBigPromosUseCase
    implements UseCase<Result<List<BigPromoModel>>, void> {
  final BigPromoRepository _repository;
  GetBigPromosUseCase(this._repository);

  @override
  Future<Result<List<BigPromoModel>>> call(void params) {
    return _repository.getBigPromos();
  }
}
