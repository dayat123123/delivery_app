import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/wishlish/domain/repositories/favorite_repository.dart';
import 'package:delivery_app/dependency_injection.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/features/wishlish/domain/entities/cart_model.dart';
import 'package:delivery_app/features/wishlish/domain/entities/group_cart_model.dart';
import 'package:delivery_app/features/wishlish/domain/usecases/add_item_to_group_favorit/add_item_group_favorit.dart';
import 'package:delivery_app/features/wishlish/domain/usecases/change_group_name_favorit/change_group_name_favorit.dart';
import 'package:delivery_app/features/wishlish/domain/usecases/check_item_is_exist/check_item_is_exist.dart';
import 'package:delivery_app/features/wishlish/domain/usecases/create_new_group_favorit/create_new_group_favorit.dart';
import 'package:delivery_app/features/wishlish/domain/usecases/get_list_favorit/get_list_favorit.dart';
import 'package:delivery_app/features/wishlish/domain/usecases/remove_group_favorit/remove_group_favorit.dart';
import 'package:delivery_app/features/wishlish/domain/usecases/remove_item_from_group_favorit/remove_item_from_group_favorit.dart';
import 'package:delivery_app/features/wishlish/domain/usecases/utils/params.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  static final favoriteRepository = inject.get<FavoriteRepository>();
  final GetListFavorit getListFavorit = GetListFavorit(favoriteRepository);
  final CreateNewGroupFavorit createNewGroupFavorit =
      CreateNewGroupFavorit(favoriteRepository);
  final RemoveDataGroupFavorit removeDataGroupFavorit =
      RemoveDataGroupFavorit(favoriteRepository);
  final ChangeGroupNameFavorit changeGroupNameFavorit =
      ChangeGroupNameFavorit(favoriteRepository);
  final AddItemGroupFavorit addItemGroupFavorit =
      AddItemGroupFavorit(favoriteRepository);
  final RemoveItemFromGroupFavorit removeItemFromGroupFavorit =
      RemoveItemFromGroupFavorit(favoriteRepository);
  final CheckItemIsExist checkItemIsExist =
      CheckItemIsExist(favoriteRepository);
  FavoriteBloc() : super(FavoritesLoading()) {
    on<LoadFavorites>(_onLoadFavorites);
    on<LoadAllFavorites>(_onLoadAllFavorites);
    on<ToggleFavorite>(_onToggleFavorite);
    on<CreateNewGroupFavorite>(_onCreateNewGroupFavorit);
    on<CreateNewGroupFavoriteWithId>(_onCreateNewGroupFavoriteWithId);
    on<RemoveGroupFavorit>(_onRemoveGroupFavorit);
    on<ChangeGroupName>(_onChangeGroupName);
    on<RemoveProductItem>(_onRemoveProductItem);
  }

  void _onLoadFavorites(
      LoadFavorites event, Emitter<FavoriteState> emit) async {
    emit(FavoritesLoading());
    final result = await getListFavorit.call(null);
    if (result is Success) {
      final List<GroupCartModel> datalist = result.resultValue!;
      final databool = await Future.wait(datalist.map((favorite) async {
        final result = await checkItemIsExist.call(GroupAndProductidParam(
            groupCartName: favorite.groupCartName, productId: event.productId));
        if (result is Success) {
          return true;
        } else {
          return false;
        }
      }).toList());
      emit(FavoritesLoaded(datalist, databool));
    } else {
      emit(FavoritesError(result.errorMessage.toString()));
    }
  }

  void _onLoadAllFavorites(
      LoadAllFavorites event, Emitter<FavoriteState> emit) async {
    final result = await getListFavorit.call(null);
    if (result is Success) {
      emit(AllFavoritesLoaded(result.resultValue!));
    } else {
      emit(FavoritesError(result.errorMessage.toString()));
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
        final result = await removeItemFromGroupFavorit.call(
            GroupAndProductidParam(
                groupCartName: selectedGroup.groupCartName,
                productId: event.data.productId));
        if (result is Failed) return;
      } else {
        CartModel member = CartModel(
            productId: event.data.productId,
            productName: event.data.productName,
            productPrice: event.data.productPrice,
            productImage: event.data.productImage);
        final result = await addItemGroupFavorit.call(GroupAndCartModelParam(
            groupCartName: selectedGroup.groupCartName, data: member));
        if (result is Failed) return;
      }
      updatedIsFavorite[event.index] = !statebool;
      emit(FavoritesLoaded(currentState.favorites, updatedIsFavorite));
    }
  }

  void _onCreateNewGroupFavorit(
      CreateNewGroupFavorite event, Emitter<FavoriteState> emit) async {
    final result = await createNewGroupFavorit.call(event.data);
    if (result is Success) {
      event.onDone();
      emit(AllFavoritesLoaded(result.resultValue!));
    } else {
      event.context.showCustomSnackbar(
          type: DialogAccentType.failed,
          description: "Group ${event.data.groupCartName} is exist");
    }
  }

  void _onCreateNewGroupFavoriteWithId(
      CreateNewGroupFavoriteWithId event, Emitter<FavoriteState> emit) async {
    if (state is FavoritesLoaded) {
      final currentState = state as FavoritesLoaded;
      final result = await createNewGroupFavorit.call(event.data);
      if (result is Success) {
        emit(FavoritesLoading());
        event.onDone(true, event.data.groupCartName);
        final newDataList = result.resultValue!;
        final updatedIsFavorite = List<bool>.from(currentState.databool);
        updatedIsFavorite.insert(0, false);
        emit(FavoritesLoaded(newDataList, updatedIsFavorite));
      } else {
        event.onDone(false, event.data.groupCartName);
        final List<GroupCartModel> updatedFavorites =
            List.from(currentState.favorites);
        final updatedIsFavorite = List<bool>.from(currentState.databool);
        emit(FavoritesLoaded(updatedFavorites, updatedIsFavorite));
      }
    }
  }

  void _onRemoveGroupFavorit(
      RemoveGroupFavorit event, Emitter<FavoriteState> emit) async {
    final result = await removeDataGroupFavorit.call(event.groupFavoritName);
    if (result is Success) {
      final List<GroupCartModel> newData = result.resultValue!;
      if (newData.isEmpty) {
        emit(FavoritesError("Data is empty"));
      } else {
        emit(AllFavoritesLoaded(newData));
      }
    }
  }

  void _onRemoveProductItem(
      RemoveProductItem event, Emitter<FavoriteState> emit) async {
    if (state is AllFavoritesLoaded) {
      final currentState = state as AllFavoritesLoaded;
      final result = await removeItemFromGroupFavorit.call(
          GroupAndProductidParam(
              groupCartName: event.groupCartName, productId: event.productId));
      if (result is Success) {
        emit(FavoritesLoading());
        emit(AllFavoritesLoaded(result.resultValue!));
      } else {
        emit(AllFavoritesLoaded(currentState.favorites));
      }
    }
  }

  void _onChangeGroupName(
      ChangeGroupName event, Emitter<FavoriteState> emit) async {
    final result = await changeGroupNameFavorit.call(ChangeGrupNameFavoritParam(
        oldgroupCartName: event.oldGroupName,
        newgroupCartName: event.newGroupName));
    if (state is AllFavoritesLoaded) {
      final currentState = state as AllFavoritesLoaded;
      if (result is Success) {
        event.onDone();
        emit(AllFavoritesLoaded(result.resultValue!));
      } else {
        event.onFailed();
        emit(currentState);
      }
    }
  }
}
