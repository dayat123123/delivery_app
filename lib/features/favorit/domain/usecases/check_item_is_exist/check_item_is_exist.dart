import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/favorit/data/favorite_respositories_impl.dart';
import 'package:delivery_app/features/favorit/domain/usecases/utils/params.dart';

class CheckItemIsExist
    implements UseCase<Result<bool>, GroupAndProductidParam> {
  final FavoriteRespositoriesImpl favoriteRespositoriesImpl;

  CheckItemIsExist(this.favoriteRespositoriesImpl);

  @override
  Future<Result<bool>> call(GroupAndProductidParam params) async {
    return await favoriteRespositoriesImpl.checkItemIsExist(
        params.groupCartName, params.productId);
  }
}
