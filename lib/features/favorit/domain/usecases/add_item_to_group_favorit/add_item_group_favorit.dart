import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/favorit/data/favorite_respositories_impl.dart';
import 'package:delivery_app/features/favorit/domain/usecases/utils/params.dart';

class AddItemGroupFavorit
    implements UseCase<Result<void>, GroupAndCartModelParam> {
  final FavoriteRespositoriesImpl favoriteRespositoriesImpl;

  AddItemGroupFavorit(this.favoriteRespositoriesImpl);
  @override
  Future<Result<void>> call(GroupAndCartModelParam params) async {
    return await favoriteRespositoriesImpl.addItemtoGroupFavorit(
        params.groupCartName, params.data);
  }
}
