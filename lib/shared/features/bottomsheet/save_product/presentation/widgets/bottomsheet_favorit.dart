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
import 'package:delivery_app/shared/widgets/card_container.dart';
import 'package:delivery_app/shared/widgets/network_image.dart';
import 'package:delivery_app/shared/widgets/textfield.dart';
import 'package:flutter/material.dart';

void showBottomSheetSaveProduct(BuildContext context, CartModel data,
    {required TextEditingController controller}) {
  final themeColors = context.themeColors;
  final favoriteBloc = inject.get<FavoriteBloc>()
    ..add(LoadFavorites(data.productId));
  context.showBottomSheet(
      child: FavoriteListTile(
          data: CartModel(
              productId: data.productId,
              productName: data.productName,
              productImage: data.productImage)),
      header: Column(children: [
        Container(
            padding:
                StyleHelpers.horizontalPadding.copyWith(bottom: 10, top: 0),
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
                      flex: 6,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Save"),
                            Text(data.productName,
                                maxLines: 1, overflow: TextOverflow.ellipsis)
                          ])),
                  const SizedBox(width: 5),
                  Expanded(
                      flex: 1,
                      child: const Icon(Icons.favorite_border).centerRight)
                ])),
        ListTile(
            onTap: () =>
                showBottomSheetCreateNewFavorit(context, onDone: (p0, p1) {
                  if (p0) {
                    context.pop();
                    context.showCustomSnackbar(
                        type: DialogAccentType.success,
                        description: "Saved new group");
                    favoriteBloc.add(LoadFavorites(data.productId));
                  } else {
                    context.showCustomSnackbar(
                        type: DialogAccentType.failed,
                        description: "Group $p1 is exist");
                  }
                }),
            title: const Text("Create group"),
            leading: CardContainer(
                width: 30,
                height: 30,
                child: Icon(Icons.add, color: context.theme.primaryColor)))
      ]));
}

void showBottomSheetCreateNewFavorit(BuildContext context,
    {void Function(bool, String)? onDone}) {
  final themeColors = context.themeColors;
  final store = inject.get<DatabaseHelper>();
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
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
                    "Enter your group name in this form and the maximum character limit is 20.",
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
                    labelText: "Group Name",
                    text: "Input group name",
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
                child: const Text("New Group",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500))
                    .center),
            Expanded(
                flex: 1,
                child: CustomButton(
                  onPressed: () async {
                    if ((formKey.currentState?.validate() ?? false)) {
                      bool state = await store.createNewGroupFavorit(
                          GroupCartModel(groupCartName: controller.text));
                      onDone?.call(state, controller.text);
                    }
                  },
                  fontsize: 16,
                  text: "Save",
                  buttonType: ButtonType.textbutton,
                ).centerRight)
          ])));
}
