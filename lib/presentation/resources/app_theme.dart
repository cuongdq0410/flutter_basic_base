import 'package:flutter/material.dart';
import 'package:flutter_basic_base/presentation/resources/app_colors.dart';

import 'app_text_styles.dart';

class AppTheme with ChangeNotifier {
  static bool _isDarkTheme = false;

  static ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void changeTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  //Primary
  static const Color _lightPrimaryColor = AppColors.primary;

  //Background
  static const Color _lightBackgroundColor = AppColors.backgroundLighter;
  static const Color _darkBackgroundColor = AppColors.backgroundDarker;

  //Text
  static const Color _lightTextColor = AppColors.textBlack;
  static const Color _darkTextColor = AppColors.white;

  //Icon
  static const Color _lightIconColor = AppColors.iconBlack;
  static const Color _darkIconColor = AppColors.white;

  static final TextTheme _lightTextTheme = TextTheme(
    headline5: AppTextStyle.h5.copyWith(color: _lightTextColor),
    headline6: AppTextStyle.h6.copyWith(color: _lightTextColor),
    headline4: AppTextStyle.h4.copyWith(color: _lightTextColor),
    headline3: AppTextStyle.h3.copyWith(color: _lightTextColor),
    headline2: AppTextStyle.h2.copyWith(color: _lightTextColor),
    headline1: AppTextStyle.h1.copyWith(color: _lightTextColor),
    subtitle1: AppTextStyle.subTitle1.copyWith(color: _lightTextColor),
    subtitle2: AppTextStyle.subTitle2.copyWith(color: _lightTextColor),
    bodyText1: AppTextStyle.bodyText1.copyWith(color: _lightTextColor),
    bodyText2: AppTextStyle.bodyText2.copyWith(color: _lightTextColor),
    button: AppTextStyle.buttonBold.copyWith(color: _lightTextColor),
    caption: AppTextStyle.caption.copyWith(color: _lightTextColor),
  );

  static final TextTheme _dartTextTheme = TextTheme(
    headline5: AppTextStyle.h5.copyWith(color: _darkTextColor),
    headline6: AppTextStyle.h6.copyWith(color: _darkTextColor),
    headline4: AppTextStyle.h4.copyWith(color: _darkTextColor),
    headline3: AppTextStyle.h3.copyWith(color: _darkTextColor),
    headline2: AppTextStyle.h1.copyWith(color: _darkTextColor),
    subtitle1: AppTextStyle.subTitle1.copyWith(color: _darkTextColor),
    subtitle2: AppTextStyle.subTitle2.copyWith(color: _darkTextColor),
    bodyText1: AppTextStyle.bodyText1.copyWith(color: _darkTextColor),
    bodyText2: AppTextStyle.bodyText2.copyWith(color: _darkTextColor),
    button: AppTextStyle.buttonBold.copyWith(color: _darkTextColor),
    caption: AppTextStyle.caption.copyWith(color: _darkTextColor),
  );

  static final ElevatedButtonThemeData _elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: AppColors.buttonYellow,
      onPrimary: AppColors.white,
      textStyle: AppTextStyle.buttonBold,
    ),
  );

  static const AppBarTheme _appBarTheme = AppBarTheme(
    backgroundColor: AppColors.white,
  );

  static final BottomNavigationBarThemeData _bottomNavigationBarThemeData =
      BottomNavigationBarThemeData(
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primary,
          selectedIconTheme: const IconThemeData(color: AppColors.primary),
          unselectedItemColor: AppColors.disable,
          selectedLabelStyle: AppTextStyle.bottomNavigatorText
              .copyWith(color: AppColors.primary.withOpacity(0.1)),
          unselectedLabelStyle: AppTextStyle.bottomNavigatorText);

  static OutlineInputBorder _defaultBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      borderSide: BorderSide(color: AppColors.border, width: 1),
    );
  }

  static final InputDecorationTheme _inputDecorationLightTheme =
      InputDecorationTheme(
    isDense: true,
    labelStyle: AppTextStyle.subTitle1.copyWith(color: AppColors.hintText),
    hintStyle: AppTextStyle.subTitle1.copyWith(color: AppColors.hintText),
    errorStyle: AppTextStyle.caption.copyWith(color: AppColors.red),
    border: _defaultBorder(),
    focusedBorder: _defaultBorder().copyWith(
        borderSide: const BorderSide(color: AppColors.primary, width: 1)),
    enabledBorder: _defaultBorder(),
    disabledBorder: _defaultBorder(),
    errorBorder: _defaultBorder()
        .copyWith(borderSide: const BorderSide(color: AppColors.red, width: 1)),
    focusedErrorBorder: _defaultBorder().copyWith(
      borderSide: const BorderSide(color: AppColors.red, width: 1),
    ),
  );

  ///Light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    elevatedButtonTheme: _elevatedButtonThemeData,
    primaryColor: _lightPrimaryColor,
    scaffoldBackgroundColor: _lightBackgroundColor,
    bottomNavigationBarTheme: _bottomNavigationBarThemeData,
    textTheme: _lightTextTheme,
    appBarTheme: _appBarTheme,
    inputDecorationTheme: _inputDecorationLightTheme,
    fontFamily: AppTextStyle.fontFamily,
  );

  ///Dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    elevatedButtonTheme: _elevatedButtonThemeData,
    cardColor: AppColors.background,
    primaryColor: _lightPrimaryColor,
    scaffoldBackgroundColor: _darkBackgroundColor,
    bottomNavigationBarTheme: _bottomNavigationBarThemeData,
    appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: _darkIconColor),
        titleTextStyle: AppTextStyle.h6,
        backgroundColor: _lightPrimaryColor),
    iconTheme: const IconThemeData(
      color: _lightIconColor,
    ),
    textTheme: _dartTextTheme,
    fontFamily: AppTextStyle.fontFamily,
  );
}
