import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delivery_app/core/utils/storace_helper/storage_helper.dart';
import 'package:delivery_app/shared/misc/storage_keys.dart';
import 'package:delivery_app/shared/extensions/theme_extensions/theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  final StorageHelper storageHelper;
  bool isDarkTheme;

  ThemeCubit(this.storageHelper)
      : isDarkTheme = false,
        super(darkTheme) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    isDarkTheme = await storageHelper.read(StorageKeys.isDarkMode) ?? false;
    emit(isDarkTheme ? darkTheme : lightTheme);
  }

  void switchTheme() async {
    isDarkTheme = !isDarkTheme;
    await storageHelper.write(StorageKeys.isDarkMode, isDarkTheme);
    emit(isDarkTheme ? darkTheme : lightTheme);
  }
}
