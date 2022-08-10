import 'package:flutter/cupertino.dart';

import 'app_constant.dart';

class AppTextStyle {
  static String fontFamily = 'Kanit';

  static TextStyle get h6 => const TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize20,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get h5 => const TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize26,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get h4 => const TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize22,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get h3 => const TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize16,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get h2 => const TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize14,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get h1 => const TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize13,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get buttonBold => const TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize14,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get buttonNormal => const TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize14,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get caption => const TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize12,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get subTitle1 => const TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize16,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get subTitle2 => const TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize14,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get bodyText1 => const TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize14,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get bodyText2 => const TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize14,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get bottomNavigatorText => const TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize10,
        fontWeight: FontWeight.w400,
      );
}
