import 'package:delivery_app/features/wishlish/domain/entities/group_cart_model.dart';

abstract class FavoriteLocalDataSource {
  Future<List<GroupCartModel>> fetchGroupFavorite();
  Future<void> saveGroupFavorite(List<GroupCartModel> favorites);
}
