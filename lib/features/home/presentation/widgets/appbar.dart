import 'package:delivery_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:delivery_app/shared/extensions/theme_extensions/theme_cubit.dart';
import 'package:delivery_app/shared/misc/file_paths.dart';
import 'package:delivery_app/shared/misc/app_pages.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/pop_up_menu_button.dart';
import 'package:delivery_app/shared/widgets/network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBar customAppBar(BuildContext context,
    {void Function()? onTap,
    required ThemeCubit themeCubit,
    required AuthenticationBloc authBloc}) {
  return AppBar(
      leading: CustomDropDownButton(
          popupmenuitem: [
            PopupMenuItemCustom(
                onTap: () => themeCubit.switchTheme(),
                widget: _itemDropdown(context,
                    name: themeCubit.isDarkTheme ? "Dark Mode" : "Light Mode",
                    icon: Icon(
                        themeCubit.isDarkTheme
                            ? Icons.dark_mode
                            : Icons.light_mode,
                        size: 16))),
            PopupMenuItemCustom(
                onTap: () {},
                widget: _itemDropdown(context,
                    name: "Settings",
                    icon: const Icon(Icons.settings, size: 16))),
            PopupMenuItemCustom(
                onTap: () => context.showDialogCustom(
                    onPressed: () => authBloc..add(LoggedOut()),
                    title: "Confirm",
                    content: "Are you sure want to logout?"),
                widget: _itemDropdown(context,
                    name: "Sign Out", icon: const Icon(Icons.logout, size: 16)))
          ],
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            bloc: authBloc,
            builder: (context, state) {
              if (state is AuthenticationAuthenticated) {
                return CustomNetworkImage(
                    isshowProgressOnLoading: false,
                    width: 35,
                    height: 35,
                    networkImgUrl: state.user.photoUrl,
                    shape: CustomNetworkImageShape.circle);
              }
              return const CustomNetworkImage(
                  width: 35,
                  height: 35,
                  assetImgUrl: FilePaths.malejpg,
                  shape: CustomNetworkImageShape.circle);
            },
          ).marginOnly(left: 8)),
      centerTitle: true,
      title: const Text(applicationName),
      actions: [
        GestureDetector(
            onTap: () => context.pushNamed(RouteNames.notificationpage),
            child: const Icon(Icons.notifications_none, size: 28)
                .marginOnly(right: 8))
      ]);
}

Widget _itemDropdown(BuildContext context,
    {required String name, required Icon icon}) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon.marginOnly(right: 8),
        Text(name,
            style: context.textTheme.bodyMedium?.copyWith(fontSize: 14),
            softWrap: false)
      ]);
}
