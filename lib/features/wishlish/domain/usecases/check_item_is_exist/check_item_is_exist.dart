import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/wishlish/domain/repositories/favorite_repository.dart';
import 'package:delivery_app/features/wishlish/domain/usecases/utils/params.dart';

class CheckItemIsExist
    implements UseCase<Result<bool>, GroupAndProductidParam> {
  final FavoriteRepository favoriteRepository;

  CheckItemIsExist(this.favoriteRepository);

  @override
  Future<Result<bool>> call(GroupAndProductidParam params) async {
    return await favoriteRepository.checkItemIsExist(
        params.groupCartName, params.productId);
  }
}
