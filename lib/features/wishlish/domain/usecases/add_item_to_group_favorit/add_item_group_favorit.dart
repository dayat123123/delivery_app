import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/wishlish/domain/repositories/favorite_repository.dart';
import 'package:delivery_app/features/wishlish/domain/usecases/utils/params.dart';

class AddItemGroupFavorit
    implements UseCase<Result<bool>, GroupAndCartModelParam> {
  final FavoriteRepository favoriteRepository;

  AddItemGroupFavorit(this.favoriteRepository);
  @override
  Future<Result<bool>> call(GroupAndCartModelParam params) async {
    return await favoriteRepository.addItemtoGroupFavorit(
        params.groupCartName, params.data);
  }
}
