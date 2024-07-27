import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/wishlish/domain/entities/group_cart_model.dart';
import 'package:delivery_app/features/wishlish/domain/repositories/favorite_repository.dart';

class RemoveDataGroupFavorit
    implements UseCase<Result<List<GroupCartModel>>, String> {
  final FavoriteRepository favoriteRepository;

  RemoveDataGroupFavorit(this.favoriteRepository);
  @override
  Future<Result<List<GroupCartModel>>> call(String params) async {
    return await favoriteRepository.removeGroupFavorit(params);
  }
}
