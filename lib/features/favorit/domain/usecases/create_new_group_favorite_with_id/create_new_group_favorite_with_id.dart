import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/favorit/data/favorite_respositories_impl.dart';

class CreateNewGroupFavoriteWithIdUseCase
    implements UseCase<Result<bool>, void> {
  final FavoriteRespositoriesImpl favoriteRespositoriesImpl;

  CreateNewGroupFavoriteWithIdUseCase(this.favoriteRespositoriesImpl);

  @override
  Future<Result<bool>> call(void params) async {
    // TODO: implement call
    throw UnimplementedError();
  }
}
