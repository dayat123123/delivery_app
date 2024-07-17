import 'package:delivery_app/core/utils/local_database/cart_model.dart';
import 'package:delivery_app/core/utils/local_database/group_cart_model.dart';
import 'package:delivery_app/core/utils/local_database/local_database_helper.dart';
import 'package:delivery_app/injector.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/features/bottomsheet/save_product/bloc/favorite_bloc.dart';
import 'package:delivery_app/shared/features/bottomsheet/save_product/presentation/widgets/favorite_listtile.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:delivery_app/shared/widgets/button.dart';
import 'package:delivery_app/shared/widgets/network_image.dart';
import 'package:delivery_app/shared/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

showBottomSheetSaveProduct(BuildContext context, CartModel data) {
  final themeColors = context.themeColors;
  context.read<FavoriteBloc>().add(LoadFavorites(data.productId));
  context.showBottomSheet(
      child: FavoriteListTile(
          data: CartModel(
              productId: data.productId,
              productName: data.productName,
              productImage: data.productImage)),
      header: Container(
          padding: StyleHelpers.horizontalPadding.copyWith(bottom: 10, top: 0),
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1, color: themeColors.appContainerShadow)),
              color: themeColors.appContainerBackground),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: StyleHelpers.borderRadiusGeometry,
                    child: CustomNetworkImage(
                        width: 60,
                        height: 50,
                        networkImgUrl: data.productImage)),
                const SizedBox(width: 15),
                Expanded(
                    child: Row(children: [
                  const Flexible(
                      flex: 6,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Save"),
                            Text("Roasted salmond with salted egg chicken",
                                maxLines: 1, overflow: TextOverflow.ellipsis)
                          ])),
                  const SizedBox(width: 5),
                  Expanded(child: const Icon(Icons.favorite_border).centerRight)
                ]))
              ])));
}

showBottomSheetCreateNewFavorit(BuildContext context,
    {required TextEditingController controller,
    required GlobalKey<FormState> formKey,
    void Function(bool)? onDone}) {
  final themeColors = context.themeColors;
  final store = inject.get<DatabaseHelper>();
  context.showBottomSheet(
      showDragHandle: true,
      initialChildSize: 1,
      isScrollChild: false,
      isScrollControlled: true,
      maxChildSize: 1,
      minChildSize: 1,
      child: Container(
          padding: StyleHelpers.allPadding,
          child: Column(children: [
            const Text(
                    "Enter your collection name in this form and the maximum character limit is 20.",
                    style: TextStyle(fontSize: 15))
                .centerLeft,
            const SizedBox(height: 5),
            Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: CustomTextField(
                    autoFocus: true,
                    controller: controller,
                    maxLength: 20,
                    validator: (p0) => emptyValidator(p0),
                    labelText: "Collection Name",
                    text: "Input collection name",
                    textFieldType: TextFieldType.text))
          ])),
      header: Container(
          padding: const EdgeInsets.symmetric(
                  horizontal: StyleHelpers.horizontalPaddingnumber)
              .copyWith(bottom: 10, top: 0),
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1, color: themeColors.appContainerShadow)),
              color: themeColors.appContainerBackground),
          child: Row(children: [
            Expanded(
                flex: 1,
                child: GestureDetector(
                    onTap: () => context.pop(),
                    child: const Text("Cancel", style: TextStyle(fontSize: 16))
                        .centerLeft)),
            Expanded(
                flex: 1,
                child: const Text("New Collection",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500))
                    .center),
            Expanded(
                flex: 1,
                child: CustomButton(
                  fontsize: 16,
                  onPressed: () async {
                    if ((formKey.currentState?.validate() ?? false)) {
                      bool state = await store.createNewGroupFavorit(
                          GroupCartModel(groupCartName: controller.text));
                      onDone?.call(state);
                    }
                  },
                  text: "Save",
                  buttonType: ButtonType.textbutton,
                ).centerRight)
          ])));
}
