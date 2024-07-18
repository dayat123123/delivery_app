import 'dart:io';

import 'package:delivery_app/features/authentication/bloc/auth_bloc.dart';
import 'package:delivery_app/shared/extensions/theme_extensions/theme_cubit.dart';
import 'package:delivery_app/injector.dart';
import 'package:delivery_app/shared/misc/file_paths.dart';
import 'package:delivery_app/shared/misc/app_pages.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/dropdown_button.dart';
import 'package:delivery_app/shared/widgets/widget_without_splash.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context, {void Function()? onTap}) {
  final themeCubit = inject.get<ThemeCubit>();
  final authBloc = inject.get<AuthenticationBloc>();
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
                onTap: () {
                  context.showDialogCustom(
                      alowDismiss: false,
                      onPressed: () => authBloc..add(LoggedOut()),
                      title: "Confirm",
                      content: "Are you sure want to logout?");
                },
                widget: _itemDropdown(context,
                    name: "Sign Out", icon: const Icon(Icons.logout, size: 16)))
          ],
          child: WidgetWithoutSplash(
            child: Transform.scale(
                scale: Platform.isAndroid ? 0.7 : 1,
                child: const CircleAvatar(
                        backgroundImage: AssetImage(FilePaths.malejpg))
                    .marginOnly(left: 8)),
          )),
      centerTitle: true,
      actions: [
        GestureDetector(
            onTap: () => context.pushNamed(RouteNames.notificationpage),
            child: const Icon(
              Icons.notifications_none,
              size: 28,
            ).marginOnly(right: 8))
      ],
      title: const Text(applicationName));
}

Widget _itemDropdown(BuildContext context,
    {required String name, required Icon icon}) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon.spaceH(before: false, after: true, spacing: 10),
        Text(name,
            style: context.textTheme.bodyMedium?.copyWith(fontSize: 14),
            softWrap: false)
      ]);
}
