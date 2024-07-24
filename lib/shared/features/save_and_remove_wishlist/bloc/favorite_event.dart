part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class LoadFavorites extends FavoriteEvent {
  final String productId;
  const LoadFavorites(this.productId);

  @override
  List<Object> get props => [productId];
}

class LoadAllFavorites extends FavoriteEvent {
  const LoadAllFavorites();

  @override
  List<Object> get props => [];
}

class CreateNewGroupFavorite extends FavoriteEvent {
  final GroupCartModel data;
  final void Function(bool, String) onDone;
  const CreateNewGroupFavorite({required this.data, required this.onDone});
  @override
  List<Object> get props => [data, onDone];
}

class CreateNewGroupFavoriteWithId extends FavoriteEvent {
  final GroupCartModel data;
  final void Function(bool, String) onDone;
  final String productId;
  const CreateNewGroupFavoriteWithId(
      {required this.data, required this.onDone, required this.productId});
  @override
  List<Object> get props => [data, onDone, productId];
}

class ToggleFavorite extends FavoriteEvent {
  final int index;
  final CartModel data;

  const ToggleFavorite({required this.index, required this.data});

  @override
  List<Object> get props => [index, data];
}

class RemoveGroupFavorit extends FavoriteEvent {
  final String groupFavoritName;

  const RemoveGroupFavorit({required this.groupFavoritName});

  @override
  List<Object> get props => [groupFavoritName];
}

class RemoveProductId extends FavoriteEvent {
  final int index;
  final String productId;

  const RemoveProductId({required this.index, required this.productId});

  @override
  List<Object> get props => [index, productId];
}
