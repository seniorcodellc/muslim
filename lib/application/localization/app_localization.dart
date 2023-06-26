import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum LanguageType { arabic, english }

const String arabic = "ar";
const String english = "en";

abstract class AppLocalization {
  static const String englishCode = 'en';
  static const String englishCountry = 'US';
  static const String arabicCode = 'ar';
  static const String arabicCountry = 'EG';
  static const Locale englishLocale = Locale(englishCode, englishCountry);
  static const Locale arabicLocale = Locale(arabicCode, arabicCountry);
  static const Locale defaultLocale = englishLocale;
  static const List<Locale> supportedLocales = [englishLocale, arabicLocale];
  static const String translationPath = 'assets/translations';
  static String apiLocaleCode = apiEnglishLocaleCode;
  static String apiEnglishLocaleCode = '$englishCode-$englishCountry';
  static String apiArabicLocaleCode = '$arabicCode-$arabicCountry';
  static Map<LanguageType, String>  appLanguages ={
    LanguageType.english: 'en',
    LanguageType.arabic: 'ar',
  };
  static Map<LanguageType,Locale> appLocales ={
    LanguageType.english: englishLocale,
    LanguageType.arabic: arabicLocale,
  };
  static Map<LanguageType,String> appApiLanguage ={
    LanguageType.english: apiEnglishLocaleCode,
    LanguageType.arabic: apiArabicLocaleCode,
  };
  static getValue(LanguageType languageType)=>appLanguages[languageType];
  static Locale getLocale(LanguageType languageType)=>appLocales[languageType]!;
  static String getApiLanguage(LanguageType languageType)=>appApiLanguage[languageType]!;
}

extension LanguageTypeExtension on LanguageType {

  String get getValue => AppLocalization.getValue(this)!;
  Locale get getLocale => AppLocalization.getLocale(this);
  String get getApiLanguage => AppLocalization.getApiLanguage(this);
}
