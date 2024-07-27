import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/wishlish/domain/entities/group_cart_model.dart';
import 'package:delivery_app/features/wishlish/domain/repositories/favorite_repository.dart';
import 'package:delivery_app/features/wishlish/domain/usecases/utils/params.dart';

class ChangeGroupNameFavorit
    implements
        UseCase<Result<List<GroupCartModel>>, ChangeGrupNameFavoritParam> {
  final FavoriteRepository favoriteRepository;

  ChangeGroupNameFavorit(this.favoriteRepository);
  @override
  Future<Result<List<GroupCartModel>>> call(
      ChangeGrupNameFavoritParam params) async {
    return favoriteRepository.editGroupNameFavorit(
        params.oldgroupCartName, params.newgroupCartName);
  }
}
