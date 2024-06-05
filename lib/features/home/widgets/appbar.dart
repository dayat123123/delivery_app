import 'dart:io';

import 'package:delivery_app/bloc/theme/theme_cubit.dart';
import 'package:delivery_app/injector.dart';
import 'package:delivery_app/shared/constans/pathfile.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/dropdown_button.dart';
import 'package:flutter/material.dart';

double toolbarHeight = Platform.isAndroid ? 60 : 40;
AppBar customAppBar(BuildContext context) {
  final themeCubit = inject.get<ThemeCubit>();
  return AppBar(
      toolbarHeight: toolbarHeight,
      actions: [
        CustomDropDownButton(
          popupmenuitem: [
            PopupMenuItemCustom(
                onTap: () => themeCubit.switchTheme(),
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                            themeCubit.isDarkTheme
                                ? Icons.dark_mode
                                : Icons.light_mode,
                            size: 16)
                        .spaceH(before: false, after: true, spacing: 10),
                    Text(themeCubit.isDarkTheme ? "Dark Mode" : "Light Mode",
                        style: context.textTheme.bodyMedium
                            ?.copyWith(fontSize: 14),
                        softWrap: false)
                  ],
                ),
                value: null),
          ],
          child: const CircleAvatar(
                  backgroundImage: AssetImage(PathFile.malejpg), radius: 18)
              .marginOnly(right: 5),
        )
      ],
      title: const Text(applicationName));
}
