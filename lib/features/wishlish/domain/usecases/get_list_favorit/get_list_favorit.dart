import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/wishlish/domain/entities/group_cart_model.dart';
import 'package:delivery_app/features/wishlish/domain/repositories/favorite_repository.dart';

class GetListFavorit implements UseCase<Result<List<GroupCartModel>>, void> {
  final FavoriteRepository favoriteRepository;

  GetListFavorit(this.favoriteRepository);
  @override
  Future<Result<List<GroupCartModel>>> call(_) async {
    return await favoriteRepository.getListGroupFavorit();
  }
}
