part of '../theme.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color appContainerBackground;
  final Color appContainerBackground2;
  final Color appTitleBar;
  final Color appContainerShadow;
  final Color selectedLabel;
  final Color unselectedLabel;
  final Color cursorColor;
  final Color micIcon;
  final Color hintColor;
  final Color settingsDialogLanguage;
  final Color border;
  final Color upward;
  final Color downward;
  final Color neutral;
  final Color gradientColor1;
  final Color gradientColor2;
  const ThemeColors({
    required this.appTitleBar,
    required this.appContainerBackground,
    required this.appContainerBackground2,
    required this.appContainerShadow,
    required this.selectedLabel,
    required this.unselectedLabel,
    required this.cursorColor,
    required this.micIcon,
    required this.hintColor,
    required this.settingsDialogLanguage,
    required this.gradientColor1,
    required this.gradientColor2,
    required this.border,
    required this.upward,
    required this.downward,
    required this.neutral,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? appTitleBar,
    Color? appContainerBackground,
    Color? appContainerBackground2,
    Color? appContainerShadow,
    Color? selectedLabel,
    Color? unselectedLabel,
    Color? cursorColor,
    Color? micIcon,
    Color? hintColor,
    Color? settingsDialogLanguage,
    Color? border,
    Color? upward,
    Color? downward,
    Color? neutral,
  }) {
    return ThemeColors(
      gradientColor1: gradientColor1,
      gradientColor2: gradientColor2,
      appContainerBackground:
          appContainerBackground ?? this.appContainerBackground,
      appContainerBackground2:
          appContainerBackground2 ?? this.appContainerBackground2,
      appTitleBar: appTitleBar ?? this.appTitleBar,
      appContainerShadow: appContainerShadow ?? this.appContainerShadow,
      selectedLabel: selectedLabel ?? this.selectedLabel,
      unselectedLabel: unselectedLabel ?? this.unselectedLabel,
      cursorColor: cursorColor ?? this.cursorColor,
      micIcon: micIcon ?? this.micIcon,
      hintColor: hintColor ?? this.hintColor,
      border: border ?? this.border,
      upward: upward ?? this.upward,
      downward: downward ?? this.downward,
      neutral: neutral ?? this.neutral,
      settingsDialogLanguage:
          settingsDialogLanguage ?? this.settingsDialogLanguage,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }

    return ThemeColors(
      gradientColor1: Color.lerp(gradientColor1, other.gradientColor1, t)!,
      gradientColor2: Color.lerp(gradientColor2, other.gradientColor2, t)!,
      appContainerBackground:
          Color.lerp(appContainerBackground, other.appContainerBackground, t)!,
      appContainerBackground2: Color.lerp(
          appContainerBackground2, other.appContainerBackground2, t)!,
      appTitleBar: Color.lerp(appTitleBar, other.appTitleBar, t)!,
      appContainerShadow:
          Color.lerp(appContainerShadow, other.appContainerShadow, t)!,
      selectedLabel: Color.lerp(selectedLabel, other.selectedLabel, t)!,
      unselectedLabel: Color.lerp(unselectedLabel, other.unselectedLabel, t)!,
      cursorColor: Color.lerp(cursorColor, other.cursorColor, t)!,
      micIcon: Color.lerp(micIcon, other.micIcon, t)!,
      hintColor: Color.lerp(hintColor, other.hintColor, t)!,
      border: Color.lerp(border, other.border, t)!,
      upward: Color.lerp(upward, other.upward, t)!,
      downward: Color.lerp(downward, other.downward, t)!,
      neutral: Color.lerp(neutral, other.neutral, t)!,
      settingsDialogLanguage:
          Color.lerp(settingsDialogLanguage, other.settingsDialogLanguage, t)!,
    );
  }

  static get light => ThemeColors(
        gradientColor1: AppColors.gradientColor1light,
        gradientColor2: AppColors.gradientColor2light,
        appTitleBar: AppColors.white,
        appContainerBackground: AppColors.foregroundLight,
        appContainerBackground2: AppColors.backgroundLightest,
        appContainerShadow: AppColors.grey.withOpacity(0.5),
        selectedLabel: AppColors.darkestGrey,
        unselectedLabel: AppColors.darkestGrey.withOpacity(0.7),
        cursorColor: AppColors.primary.withOpacity(0.5),
        micIcon: AppColors.black,
        hintColor: AppColors.darkerGrey,
        settingsDialogLanguage: AppColors.white,
        border: AppColors.defaultBorderLight,
        upward: AppColors.info,
        downward: AppColors.error,
        neutral: AppColors.warning,
      );

  static get dark => ThemeColors(
        gradientColor1: AppColors.gradientColor1dark,
        gradientColor2: AppColors.gradientColor2dark,
        appTitleBar: AppColors.backgroundDarkest,
        appContainerBackground: AppColors.foregroundDark,
        appContainerBackground2: AppColors.backgroundDarkest,
        appContainerShadow: AppColors.darkerGrey.withOpacity(0.2),
        selectedLabel: AppColors.darkestGrey,
        unselectedLabel: AppColors.darkestGrey.withOpacity(0.7),
        cursorColor: AppColors.primary,
        micIcon: AppColors.white,
        hintColor: AppColors.lighterGrey,
        settingsDialogLanguage: AppColors.lighterDark,
        border: AppColors.defaultBorderDark,
        upward: AppColors.success,
        downward: AppColors.error,
        neutral: AppColors.warning,
      );
}
