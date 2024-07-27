import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/favorit/data/favorite_respositories_impl.dart';
import 'package:delivery_app/features/favorit/domain/entities/group_cart_model.dart';

class CreateNewGroupFavorit
    implements UseCase<Result<List<GroupCartModel>>, GroupCartModel> {
  final FavoriteRespositoriesImpl favoriteRespositoriesImpl;

  CreateNewGroupFavorit(this.favoriteRespositoriesImpl);

  @override
  Future<Result<List<GroupCartModel>>> call(GroupCartModel params) async {
    return favoriteRespositoriesImpl.createNewGroupFavorit(params);
  }
}
