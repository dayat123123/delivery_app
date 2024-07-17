part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  @override
  List<Object> get props => [];
}

class FavoritesLoading extends FavoriteState {}

class FavoritesLoaded extends FavoriteState {
  final List<GroupCartModel> favorites;
  final List<bool> databool;

  FavoritesLoaded(this.favorites, this.databool);

  @override
  List<Object> get props => [favorites, databool];
}

class AllFavoritesLoaded extends FavoriteState {
  final List<GroupCartModel> favorites;
  AllFavoritesLoaded(this.favorites);

  @override
  List<Object> get props => [favorites];
}

class FavoritesError extends FavoriteState {
  final String message;

  FavoritesError(this.message);

  @override
  List<Object> get props => [message];
}
