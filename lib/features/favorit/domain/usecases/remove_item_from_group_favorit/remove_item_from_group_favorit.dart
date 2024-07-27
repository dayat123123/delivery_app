import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/favorit/data/favorite_respositories_impl.dart';
import 'package:delivery_app/features/favorit/domain/entities/group_cart_model.dart';
import 'package:delivery_app/features/favorit/domain/usecases/utils/params.dart';

class RemoveItemFromGroupFavorit
    implements UseCase<Result<List<GroupCartModel>>, GroupAndProductidParam> {
  final FavoriteRespositoriesImpl favoriteRespositoriesImpl;

  RemoveItemFromGroupFavorit(this.favoriteRespositoriesImpl);
  @override
  Future<Result<List<GroupCartModel>>> call(
      GroupAndProductidParam params) async {
    return await favoriteRespositoriesImpl.removeItemFromGroupFavorit(
        params.groupCartName, params.productId);
  }
}
