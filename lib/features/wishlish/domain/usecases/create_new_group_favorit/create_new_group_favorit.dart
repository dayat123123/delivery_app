import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/wishlish/domain/entities/group_cart_model.dart';
import 'package:delivery_app/features/wishlish/domain/repositories/favorite_repository.dart';

class CreateNewGroupFavorit
    implements UseCase<Result<List<GroupCartModel>>, GroupCartModel> {
  final FavoriteRepository favoriteRepository;

  CreateNewGroupFavorit(this.favoriteRepository);

  @override
  Future<Result<List<GroupCartModel>>> call(GroupCartModel params) async {
    return favoriteRepository.createNewGroupFavorit(params);
  }
}
