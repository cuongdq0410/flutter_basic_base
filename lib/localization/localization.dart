import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_base/data/storage/session_utils.dart';

import 'csv_asset_loader.dart';

enum Languages {
  en,
  vi,
}

extension LanguageExtend on Languages {
  static Languages getLanguagesFromText(String text) {
    if (text == Languages.en.name) return Languages.en;
    if (text == Languages.vi.name) return Languages.vi;
    return defaultLanguage;
  }

  String get getCountryCode {
    switch (this) {
      case Languages.en:
        return 'US';
      case Languages.vi:
        return 'VN';
      default:
        return name.toUpperCase();
    }
  }
}

const Languages defaultLanguage = Languages.en;
const List<Languages> supportedLocales = [Languages.en, Languages.vi];

class Localization {
  static void initApp(Widget application) {
    final Locale startLocale =
        Locale(currentLanguage.name, currentLanguage.getCountryCode);
    final Locale defaultLocale =
        Locale(defaultLanguage.name, defaultLanguage.getCountryCode);
    return runApp(
      EasyLocalization(
        supportedLocales: supportedLocales
            .map((locale) => Locale(locale.name, locale.getCountryCode))
            .toList(),
        fallbackLocale: defaultLocale,
        startLocale: startLocale,
        assetLoader: CsvAssetLoader(),
        path: 'resources/langs/langs.csv',
        child: application,
      ),
    );
  }

  static Languages get currentLanguage {
    return LanguageExtend.getLanguagesFromText(SessionUtils.appLanguage);
  }

  static void changeAppLanguage(BuildContext context, Languages newLanguage) {
    Locale locale = Locale(newLanguage.name, newLanguage.getCountryCode);
    context.setLocale(locale);
    _updateAppLocale(context, locale);
    SessionUtils.saveAppLanguage(newLanguage.name);
  }

  static void _updateAppLocale(BuildContext context, Locale locale) {
    context.setLocale(locale);
    Intl.defaultLocale = locale.languageCode;
    Intl.systemLocale = locale.languageCode;
  }
}
