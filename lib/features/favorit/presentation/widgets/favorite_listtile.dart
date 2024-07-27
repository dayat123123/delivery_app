import 'package:delivery_app/features/favorit/domain/entities/cart_model.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/features/favorit/presentation/bloc/favorite_bloc.dart';
import 'package:delivery_app/shared/widgets/checkbox_listtile.dart';
import 'package:delivery_app/shared/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delivery_app/injector.dart';

class FavoriteListTile extends StatelessWidget {
  final CartModel data;
  const FavoriteListTile({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    final favoriteBloc = inject.get<FavoriteBloc>();
    return BlocBuilder<FavoriteBloc, FavoriteState>(
        bloc: favoriteBloc,
        builder: (context, state) {
          if (state is FavoritesLoading) {
            return Center(child: progressIndicatorWidget(context: context))
                .marginOnly(top: 10);
          } else if (state is FavoritesLoaded) {
            return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.favorites.length,
                itemBuilder: (context, index) {
                  return CustomCheckboxListtile(
                      title: state.favorites[index].groupCartName,
                      value: state.databool[index],
                      onChanged: (value) => favoriteBloc
                          .add(ToggleFavorite(index: index, data: data)));
                });
          } else if (state is FavoritesError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
