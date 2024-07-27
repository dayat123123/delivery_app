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
  final void Function() onDone;
  final BuildContext context;
  const CreateNewGroupFavorite(this.context,
      {required this.data, required this.onDone});
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

class RemoveProductItem extends FavoriteEvent {
  final String groupCartName;
  final String productId;
  const RemoveProductItem(
      {required this.groupCartName, required this.productId});

  @override
  List<Object> get props => [groupCartName, productId];
}

class ChangeGroupName extends FavoriteEvent {
  final String oldGroupName;
  final String newGroupName;
  final void Function() onDone;
  final void Function() onFailed;

  const ChangeGroupName(
      {required this.oldGroupName,
      required this.newGroupName,
      required this.onDone,
      required this.onFailed});

  @override
  List<Object> get props => [oldGroupName, newGroupName, onDone, onFailed];
}
