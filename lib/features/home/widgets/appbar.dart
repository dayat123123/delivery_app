import 'package:delivery_app/bloc/theme/theme_cubit.dart';
import 'package:delivery_app/injector.dart';
import 'package:delivery_app/shared/constans/pathfile.dart';
import 'package:delivery_app/shared/constans/route_names.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/dropdown_button.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context) {
  final themeCubit = inject.get<ThemeCubit>();
  return AppBar(
      centerTitle: true,
      actions: [
        CustomDropDownButton(
            popupmenuitem: [
              PopupMenuItemCustom(
                  onTap: () => themeCubit.switchTheme(),
                  widget: _itemDropdown(context,
                      name: themeCubit.isDarkTheme ? "Dark Mode" : "Light Mode",
                      icon: Icon(
                          themeCubit.isDarkTheme
                              ? Icons.dark_mode
                              : Icons.light_mode,
                          size: 16)),
                  value: null),
              PopupMenuItemCustom(
                  onTap: () {
                    context.pushNamedAndRemoveUntil(RouteNames.loginpage);
                  },
                  widget: _itemDropdown(context,
                      name: "Logout", icon: const Icon(Icons.logout, size: 16)),
                  value: null)
            ],
            child: const CircleAvatar(
                    backgroundImage: AssetImage(PathFile.malejpg), radius: 18)
                .marginOnly(right: 5))
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
