import 'package:delivery_app/features/favorit/domain/entities/cart_model.dart';
import 'package:delivery_app/features/favorit/domain/entities/group_cart_model.dart';
import 'package:delivery_app/injector.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/features/favorit/presentation/bloc/favorite_bloc.dart';
import 'package:delivery_app/features/favorit/presentation/widgets/favorite_listtile.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:delivery_app/shared/widgets/button.dart';
import 'package:delivery_app/shared/widgets/card_container.dart';
import 'package:delivery_app/shared/widgets/network_image.dart';
import 'package:delivery_app/shared/widgets/textfield.dart';
import 'package:flutter/material.dart';

void showBottomSheetSaveProduct(BuildContext context, CartModel data,
    {required TextEditingController controller}) {
  final favoriteBloc = inject.get<FavoriteBloc>()
    ..add(LoadFavorites(data.productId));
  context.showBottomSheet(
      child: FavoriteListTile(
          data: CartModel(
              productId: data.productId,
              productName: data.productName,
              productPrice: data.productPrice,
              productImage: data.productImage)),
      header: Column(children: [
        Container(
            padding:
                StyleHelpers.horizontalPadding.copyWith(bottom: 10, top: 0),
            height: 55,
            width: double.infinity,
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
                            const Text(
                              "Save",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            Text(data.productName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500))
                          ])),
                  Expanded(
                      flex: 1,
                      child: const Icon(Icons.favorite_border).centerRight)
                ])),
        Divider(
            height: 10,
            color: context.themeColors.appContainerShadow,
            thickness: 1),
        ListTile(
            onTap: () => showBottomSheetCreateNewFavorit(onSubmit: () {
                  favoriteBloc.add(CreateNewGroupFavoriteWithId(
                      productId: data.productId,
                      data: GroupCartModel(groupCartName: controller.text),
                      onDone: (p0, p1) {
                        if (p0) {
                          context.pop();
                          controller.clear();
                          context.showCustomSnackbar(
                              type: DialogAccentType.success,
                              description: "Saved new collection");
                        } else {
                          context.showCustomSnackbar(
                              type: DialogAccentType.failed,
                              description: "Group $p1 is exist");
                        }
                      }));
                }, context, controller: controller),
            title: const Text("Create group", style: TextStyle(fontSize: 15)),
            leading: CardContainer(
                width: 30,
                height: 30,
                withBottomMargin: false,
                child: Icon(Icons.add, color: context.theme.primaryColor)))
      ]));
}

void showBottomSheetCreateNewFavorit(BuildContext context,
    {required TextEditingController controller,
    required void Function() onSubmit}) {
  final themeColors = context.themeColors;
  final formKey = GlobalKey<FormState>();
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
                      onSubmit();
                    }
                  },
                  fontsize: 16,
                  text: "Save",
                  buttonType: ButtonType.textbutton,
                ).centerRight)
          ])));
}

void onChangeNameGroup(BuildContext context,
    {required TextEditingController controller, required String oldGroupName}) {
  final formKey = GlobalKey<FormState>();
  final favoriteBloc = inject.get<FavoriteBloc>();
  controller.text = oldGroupName;
  context.showDialogCustom(
      title: "Change group name",
      customContent: Form(
          key: formKey,
          child: CustomTextField(
              labelText: "Group Name",
              text: "Input group name",
              validator: (p0) => emptyValidator(p0),
              textFieldType: TextFieldType.text,
              controller: controller,
              autoFocus: true)),
      customOnpressed: () {
        if ((formKey.currentState?.validate() ?? false)) {
          if (controller.text.isNotEmpty) {
            if (controller.text == oldGroupName) {
              context.showCustomSnackbar(
                  type: DialogAccentType.warning,
                  title: "Warning",
                  description: "New group name can't be same as before");
            } else {
              favoriteBloc.add(ChangeGroupName(
                  onFailed: () {
                    context.showCustomSnackbar(
                        type: DialogAccentType.failed,
                        title: "Failed",
                        description: "Can't change name");
                  },
                  oldGroupName: oldGroupName,
                  newGroupName: controller.text,
                  onDone: () {
                    controller.clear();
                    context.pop();
                    context.showCustomSnackbar(
                        description: "Change group name",
                        title: "Success",
                        type: DialogAccentType.success);
                  }));
            }
          } else {
            context.showCustomSnackbar(
                type: DialogAccentType.warning,
                title: "Warning",
                description: "Form can't be empty");
          }
        }
      });
}
