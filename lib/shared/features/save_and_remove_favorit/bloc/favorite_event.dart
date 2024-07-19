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

class ToggleFavorite extends FavoriteEvent {
  final int index;
  final CartModel data;

  const ToggleFavorite({required this.index, required this.data});

  @override
  List<Object> get props => [index, data];
}

class RemoveProductId extends FavoriteEvent {
  final int index;
  final String productId;

  const RemoveProductId({required this.index, required this.productId});

  @override
  List<Object> get props => [index, productId];
}
