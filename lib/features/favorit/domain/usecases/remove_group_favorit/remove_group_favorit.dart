import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/favorit/data/favorite_respositories_impl.dart';
import 'package:delivery_app/features/favorit/domain/entities/group_cart_model.dart';

class RemoveDataGroupFavorit
    implements UseCase<Result<List<GroupCartModel>>, String> {
  final FavoriteRespositoriesImpl favoriteRespositoriesImpl;

  RemoveDataGroupFavorit(this.favoriteRespositoriesImpl);
  @override
  Future<Result<List<GroupCartModel>>> call(String params) async {
    return await favoriteRespositoriesImpl.removeGroupFavorit(params);
  }
}
