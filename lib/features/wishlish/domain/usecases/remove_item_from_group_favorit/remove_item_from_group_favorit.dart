import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/wishlish/domain/entities/group_cart_model.dart';
import 'package:delivery_app/features/wishlish/domain/repositories/favorite_repository.dart';
import 'package:delivery_app/features/wishlish/domain/usecases/utils/params.dart';

class RemoveItemFromGroupFavorit
    implements UseCase<Result<List<GroupCartModel>>, GroupAndProductidParam> {
  final FavoriteRepository favoriteRepository;

  RemoveItemFromGroupFavorit(this.favoriteRepository);
  @override
  Future<Result<List<GroupCartModel>>> call(
      GroupAndProductidParam params) async {
    return await favoriteRepository.removeItemFromGroupFavorit(
        params.groupCartName, params.productId);
  }
}
