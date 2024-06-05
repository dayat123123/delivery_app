import 'package:delivery_app/shared/extensions/theme_extensions/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(darkTheme);
  bool isDarkTheme = true;
  void switchTheme() {
    isDarkTheme = !isDarkTheme;
    isDarkTheme ? emit(darkTheme) : emit(lightTheme);
  }
}
