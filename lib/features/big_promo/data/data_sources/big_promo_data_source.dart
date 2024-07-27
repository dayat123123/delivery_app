import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/big_promo/domain/entities/big_promo_model.dart';

abstract class BigPromoDataSource {
  Future<Result<List<BigPromoModel>>> fetchBigPromos();
}
