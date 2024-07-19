import 'package:delivery_app/core/utils/local_database/local_database_helper.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/features/save_and_remove_favorit/bloc/favorite_bloc.dart';
import 'package:delivery_app/shared/features/save_and_remove_favorit/presentation/widgets/bottomsheet_favorit.dart';
import 'package:delivery_app/shared/misc/app_pages.dart';
import 'package:delivery_app/shared/misc/params_keys.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/injector.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/card_container.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = inject.get<DatabaseHelper>();
    final favoriteBloc = inject.get<FavoriteBloc>();
    return CustomScaffold(
        margin: StyleHelpers.verticalPadding,
        appbar: AppBar(title: const Text('Wishlist'), actions: [
          CardContainer(
                  height: 40,
                  alignment: Alignment.center,
                  width: 80,
                  onTap: () => showBottomSheetCreateNewFavorit(context,
                          onDone: (p0, p1) {
                        if (p0) {
                          context.pop();
                          context.showCustomSnackbar(
                              type: DialogAccentType.success,
                              description: "Saved new collection");
                          favoriteBloc.add(const LoadAllFavorites());
                        } else {
                          context.showCustomSnackbar(
                              type: DialogAccentType.failed,
                              description: "Group $p1 is exist");
                        }
                      }),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: context.theme.primaryColor),
                        Text("Group",
                            style: TextStyle(color: context.theme.primaryColor))
                      ]))
              .spaceH(
                  before: false, spacing: StyleHelpers.horizontalPaddingnumber)
        ]),
        body: BlocBuilder<FavoriteBloc, FavoriteState>(
            bloc: favoriteBloc,
            builder: (context, state) {
              if (state is FavoritesLoading) {
                return const Center(child: CircularProgressIndicator())
                    .marginOnly(top: 10);
              } else if (state is AllFavoritesLoaded) {
                if (state.favorites.isEmpty) {
                  return const Center(
                      child: Text(
                          "Groups is empty\npress add button to create new group",
                          textAlign: TextAlign.center));
                }
                return ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: state.favorites.length,
                    itemBuilder: (context, index) {
                      final item = state.favorites[index];
                      String groupName = item.groupCartName;
                      return CardContainer(
                          padding: StyleHelpers.allPadding,
                          alignment: Alignment.centerLeft,
                          height: 80,
                          onTap: () => context.pushNamed(
                              RouteNames.detailwishlistpage,
                              arguments: {ParamsKeys.groupCartModel: item},
                              onComplete: () =>
                                  favoriteBloc.add(const LoadAllFavorites())),
                          onLongPress: () {
                            context.showDialogCustom(
                                content: "Delete group $groupName",
                                onPressed: () async {
                                  await store.removeGroupWithMember(groupName);
                                  favoriteBloc.add(const LoadAllFavorites());
                                });
                          },
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(groupName,
                                    style: const TextStyle(fontSize: 16)),
                                Text("${item.items?.length ?? 0} items",
                                    style: const TextStyle(fontSize: 15))
                              ]));
                    });
              } else if (state is FavoritesError) {
                return Center(child: Text(state.message));
              } else {
                return const SizedBox.shrink();
              }
            }));
  }
}