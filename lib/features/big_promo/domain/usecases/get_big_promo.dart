import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/big_promo/domain/entities/big_promo_model.dart';
import 'package:delivery_app/features/big_promo/domain/repositories/big_promo_repository.dart';

class GetBigPromosUseCase {
  final BigPromoRepository _repository;

  GetBigPromosUseCase(this._repository);

  Future<Result<List<BigPromoModel>>> call() {
    return _repository.getBigPromos();
  }
}
