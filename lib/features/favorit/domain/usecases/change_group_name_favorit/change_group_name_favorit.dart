import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/favorit/data/favorite_respositories_impl.dart';
import 'package:delivery_app/features/favorit/domain/entities/group_cart_model.dart';
import 'package:delivery_app/features/favorit/domain/usecases/utils/params.dart';

class ChangeGroupNameFavorit
    implements
        UseCase<Result<List<GroupCartModel>>, ChangeGrupNameFavoritParam> {
  final FavoriteRespositoriesImpl favoriteRespositoriesImpl;

  ChangeGroupNameFavorit(this.favoriteRespositoriesImpl);
  @override
  Future<Result<List<GroupCartModel>>> call(
      ChangeGrupNameFavoritParam params) async {
    return favoriteRespositoriesImpl.editGroupNameFavorit(
        params.oldgroupCartName, params.newgroupCartName);
  }
}
