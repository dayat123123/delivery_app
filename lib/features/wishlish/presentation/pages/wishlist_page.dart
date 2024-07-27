import 'package:delivery_app/features/wishlish/domain/entities/group_cart_model.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/features/wishlish/presentation/bloc/favorite_bloc.dart';
import 'package:delivery_app/features/wishlish/presentation/widgets/bottomsheet_and_dialog_favorit.dart';
import 'package:delivery_app/shared/misc/app_pages.dart';
import 'package:delivery_app/shared/misc/params_keys.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:delivery_app/shared/widgets/button.dart';
import 'package:delivery_app/shared/widgets/pop_up_menu_button.dart';
import 'package:delivery_app/shared/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/injector.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/card_container.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  late TextEditingController _controllerText;
  final _favoriteBloc = inject.get<FavoriteBloc>();
  @override
  void initState() {
    _controllerText = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controllerText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        margin: StyleHelpers.topMarginScaffold,
        appbar: AppBar(title: const Text('Wishlist'), actions: [
          CustomButton(
            onPressed: () => showBottomSheetCreateNewFavorit(onSubmit: () {
              _favoriteBloc.add(CreateNewGroupFavorite(context, onDone: () {
                context.pop();
                _controllerText.clear();
                context.showCustomSnackbar(
                    type: DialogAccentType.success,
                    description: "Saved new collection");
              }, data: GroupCartModel(groupCartName: _controllerText.text)));
            }, context, controller: _controllerText),
            text: "Group",
            iconAnimated: Icons.add,
            buttonType: ButtonType.buttonWithTextAndIcon,
          ).marginOnly(right: StyleHelpers.horizontalPaddingnumber)
        ]),
        body: BlocBuilder<FavoriteBloc, FavoriteState>(
            bloc: _favoriteBloc,
            builder: (context, state) {
              if (state is FavoritesLoading) {
                return Center(child: progressIndicatorWidget(context: context))
                    .marginOnly(top: 10);
              } else if (state is AllFavoritesLoaded) {
                if (state.favorites.isEmpty) {
                  return const Center(
                      child: Text("Press add button to create group"));
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
                                  _favoriteBloc.add(const LoadAllFavorites())),
                          onLongPress: () {
                            context.showDialogCustom(
                                content: "Delete group $groupName",
                                onPressed: () async {
                                  _favoriteBloc.add(RemoveGroupFavorit(
                                      groupFavoritName: item.groupCartName));
                                });
                          },
                          child: Row(children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(groupName,
                                      style: const TextStyle(fontSize: 16)),
                                  Text("${item.items.length} items",
                                      style: const TextStyle(fontSize: 15))
                                ]),
                            const Spacer(),
                            CustomDropDownButton(
                                constraints:
                                    const BoxConstraints.tightFor(height: 120),
                                popupmenuitem: [
                                  PopupMenuItemCustom(
                                      onTap: () => context.showDialogCustom(
                                          content: "Delete group $groupName",
                                          onPressed: () async {
                                            _favoriteBloc.add(
                                                RemoveGroupFavorit(
                                                    groupFavoritName:
                                                        item.groupCartName));
                                          }),
                                      widget: const Text("Delete",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400))
                                          .center),
                                  PopupMenuItemCustom(
                                      onTap: () => onChangeNameGroup(context,
                                          controller: _controllerText,
                                          oldGroupName: item.groupCartName),
                                      widget: const Text("Edit Name",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400))
                                          .center)
                                ],
                                child: const CardContainer(
                                    withBottomMargin: false,
                                    width: 35,
                                    height: 35,
                                    child: Icon(Icons.more_horiz)))
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


// final favoriteBloc = inject.get<FavoriteBloc>();

