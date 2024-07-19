import 'package:delivery_app/core/utils/local_database/cart_model.dart';
import 'package:delivery_app/core/utils/local_database/group_cart_model.dart';
import 'package:delivery_app/core/utils/local_database/local_database_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final DatabaseHelper databaseHelper;

  FavoriteBloc({required this.databaseHelper}) : super(FavoritesLoading()) {
    on<LoadFavorites>(_onLoadFavorites);
    on<LoadAllFavorites>(_onLoadAllFavorites);
    on<ToggleFavorite>(_onToggleFavorite);
  }

  void _onLoadFavorites(
      LoadFavorites event, Emitter<FavoriteState> emit) async {
    try {
      emit(FavoritesLoading());
      final favorites = await databaseHelper.getAllGroupFavorit();
      final databool = await Future.wait(favorites
          .map((favorite) async => await databaseHelper.checkIfItemIsExists(
              groupCartName: favorite.groupCartName,
              checkItemId: event.productId))
          .toList());
      emit(FavoritesLoaded(favorites, databool));
    } catch (e) {
      emit(FavoritesError(e.toString()));
    }
  }

  void _onLoadAllFavorites(
      LoadAllFavorites event, Emitter<FavoriteState> emit) async {
    try {
      emit(FavoritesLoading());
      final favorites = await databaseHelper.getAllGroupFavorit();
      emit(AllFavoritesLoaded(favorites));
    } catch (e) {
      emit(FavoritesError(e.toString()));
    }
  }

  void _onToggleFavorite(
      ToggleFavorite event, Emitter<FavoriteState> emit) async {
    if (state is FavoritesLoaded) {
      final currentState = state as FavoritesLoaded;
      final updatedIsFavorite = List<bool>.from(currentState.databool);
      bool statebool = updatedIsFavorite[event.index];
      GroupCartModel selectedGroup = currentState.favorites[event.index];

      if (statebool) {
        await databaseHelper.removeItemFromGroupCart(
            selectedGroup.groupCartName, event.data.productId);
      } else {
        CartModel member = CartModel(
            productId: event.data.productId,
            productName: event.data.productName,
            productImage: event.data.productImage);
        bool success = await databaseHelper.addItemToGroupCart(
            selectedGroup.groupCartName, member);
        if (!success) {
          emit(FavoritesError("Failed to add item to group cart"));
          return;
        }
      }

      updatedIsFavorite[event.index] = !statebool;
      emit(FavoritesLoaded(currentState.favorites, updatedIsFavorite));
    }
  }
}
