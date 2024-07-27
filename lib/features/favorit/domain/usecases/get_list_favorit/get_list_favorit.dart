import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/favorit/data/favorite_respositories_impl.dart';
import 'package:delivery_app/features/favorit/domain/entities/group_cart_model.dart';

class GetListFavorit implements UseCase<Result<List<GroupCartModel>>, void> {
  final FavoriteRespositoriesImpl favoriteRespositoriesImpl;

  GetListFavorit(this.favoriteRespositoriesImpl);
  @override
  Future<Result<List<GroupCartModel>>> call(_) async {
    return await favoriteRespositoriesImpl.getListGroupFavorit();
  }
}
