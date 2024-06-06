part of '../theme.dart';

ThemeData get lightTheme {
  return ThemeData(
      fontFamily: 'Inter',
      drawerTheme: const DrawerThemeData(
          backgroundColor: AppColors.backgroundLightest, elevation: 0),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: AppColors.textLight,
          fontSize: 21,
          fontWeight: FontWeight.w600,
        ),
        displayLarge: TextStyle(
            color: AppColors.textLight,
            fontSize: 16,
            fontWeight: FontWeight.w700),
        displayMedium: TextStyle(
          color: AppColors.textSoftLight,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: TextStyle(
          color: AppColors.textSoftLight,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(color: AppColors.textLight),
        bodyLarge: TextStyle(
          color: AppColors.textLight,
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(color: AppColors.textLight),
        labelMedium: TextStyle(color: AppColors.textLight),
        labelLarge: TextStyle(color: AppColors.textLight),
        labelSmall: TextStyle(color: AppColors.textLight),
      ),
      scaffoldBackgroundColor: AppColors.backgroundLight,
      primaryColor: AppColors.primary,
      canvasColor: AppColors.backgroundLightest,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        onPrimary: Colors.white,
        onSurface: AppColors.black,
      ),
      visualDensity: VisualDensity.compact,
      extensions: <ThemeExtension<dynamic>>[
        ThemeColors.light,
        ThemeTextStyles.light,
        ThemePluto.light,
      ],
      appBarTheme: AppBarTheme(
        centerTitle: Platform.isAndroid ? true : false,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        toolbarHeight: Platform.isAndroid ? 60 : 30,
        color: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: headline1.copyWith(
            fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.black),
      ),
      snackBarTheme: SnackBarThemeData(
          showCloseIcon: true,
          elevation: 5,
          backgroundColor: AppColors.white.withOpacity(0.85),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14.0),
                  topRight: Radius.circular(14.0)))),
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        titleTextStyle: headline1.copyWith(
          color: AppColors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        contentTextStyle: headline1.copyWith(
          color: AppColors.black,
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: AppColors.white,
        textStyle: headline1.copyWith(
          color: AppColors.black,
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.black),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: AppColors.darkestGrey,
          selectedItemColor: AppColors.primary,
          elevation: 0,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold)),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.foregroundLight,
        filled: true,
        hintStyle: const TextStyle(
            color: AppColors.textHint, fontWeight: FontWeight.w400),
        errorStyle: const TextStyle(
          fontSize: 11.0,
        ),
        iconColor: AppColors.darkerGrey,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        labelStyle: const TextStyle(color: AppColors.darkerGrey),
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide:
              const BorderSide(width: 0.5, color: AppColors.defaultBorderLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide:
              const BorderSide(width: 0.5, color: AppColors.defaultBorderLight),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
              width: 0.5, color: AppColors.lighterGrey.withOpacity(0.4)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(width: 1, color: Colors.redAccent),
        ),
      ),
      expansionTileTheme: ExpansionTileThemeData(
          backgroundColor: AppColors.foregroundLight,
          textColor: AppColors.black,
          collapsedTextColor: AppColors.black,
          iconColor: AppColors.black,
          collapsedIconColor: AppColors.black.withOpacity(0.5)),
      scrollbarTheme: ScrollbarThemeData(
          trackColor: const WidgetStatePropertyAll(Colors.red),
          thickness: const WidgetStatePropertyAll(6),
          thumbColor:
              WidgetStatePropertyAll(AppColors.backgroundDark.withOpacity(0.5)),
          radius: const Radius.circular(10),
          minThumbLength: 50),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.foregroundLight,
              foregroundColor: AppColors.black.withOpacity(0.8),
              elevation: 0,
              shadowColor: Colors.transparent,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
              padding: const EdgeInsets.symmetric(horizontal: 2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)))),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppColors.primary, width: 1),
            disabledBackgroundColor: AppColors.grayD9.withOpacity(0.5),
            textStyle: const TextStyle(
              color: AppColors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            //minimumSize: const Size(double.infinity, 40),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            foregroundColor: AppColors.primary),
      ),
      iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(visualDensity: VisualDensity.compact)),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: AppColors.white,
        headerForegroundColor: AppColors.white,
        dayOverlayColor:
            WidgetStatePropertyAll(AppColors.primary.withOpacity(0.5)),
        yearStyle: const TextStyle(color: AppColors.primary),
        yearOverlayColor:
            WidgetStatePropertyAll(AppColors.primary.withOpacity(0.5)),
        headerBackgroundColor: AppColors.primary,
        surfaceTintColor: AppColors.white,
        dividerColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      checkboxTheme: CheckboxThemeData(
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          splashRadius: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          overlayColor:
              WidgetStatePropertyAll(AppColors.primary.withOpacity(0.1)),
          side: BorderSide(color: AppColors.black.withOpacity(0.2), width: 2)),
      tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            color: AppColors.black.withOpacity(0.9),
            borderRadius: BorderRadius.circular(4),
          ),
          textStyle: const TextStyle(color: AppColors.white, fontSize: 11),
          verticalOffset: 10),
      dividerColor: AppColors.defaultBorderLight,
      dividerTheme: const DividerThemeData(
          color: AppColors.defaultBorderLight, thickness: 0.5, space: 1));
}
