import 'package:delivery_app/core/utils/local_database/local_database_helper.dart';
import 'package:delivery_app/features/wishlish/data/data_sources/favorite_local_data_source.dart';
import 'package:delivery_app/features/wishlish/domain/entities/group_cart_model.dart';
import 'package:delivery_app/shared/misc/local_database_keys.dart';

class FavoriteLocalImpl implements FavoriteLocalDataSource {
  final DatabaseHelper _databaseHelper;

  FavoriteLocalImpl(this._databaseHelper);
  @override
  Future<List<GroupCartModel>> fetchGroupFavorite() async {
    final data = List<GroupCartModel>.from(
        _databaseHelper.box.get(LocalDatabaseKeys.groupWishlish) ?? []);
    return data;
  }

  @override
  Future<void> saveGroupFavorite(List<GroupCartModel> favorites) async {
    await _databaseHelper.box.put(LocalDatabaseKeys.groupWishlish, favorites);
  }
}
