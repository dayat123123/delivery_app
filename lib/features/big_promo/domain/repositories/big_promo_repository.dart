import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/big_promo/data/data_sources/big_promo_data_source.dart';
import 'package:delivery_app/features/big_promo/domain/entities/big_promo_model.dart';

abstract class BigPromoRepository {
  Future<Result<List<BigPromoModel>>> getBigPromos();
}

class BigPromoRepositoryImpl implements BigPromoRepository {
  final BigPromoDataSource _dataSource;

  BigPromoRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<BigPromoModel>>> getBigPromos() {
    return _dataSource.fetchBigPromos();
  }
}
