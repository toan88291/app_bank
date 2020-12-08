// GENERATED CODE - DO NOT MODIFY BY HAND
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:king_bank/common/app_session.dart';
import 'package:king_bank/constrants/preference_key.dart';
import 'package:king_bank/data/model/language_model.dart';
import 'package:king_bank/utils/utils.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) {
    print('load');
    Locale localeDisplay = locale;
    String defaultLocale = Platform.localeName;
    if (AppSession().languageSelect != null) {
      print('languageSelect : ${AppSession().languageSelect}');
      localeDisplay = getLocaleByCountry(AppSession().languageSelect);
    } else {
      Language languageDefault = getLocaleByCode(defaultLocale.split('_')[0]);
      localeDisplay = getLocaleByCountry(languageDefault.countryName);
      print('localeDisplay $localeDisplay');
      AppSession().languageSelect = languageDefault.countryName;
      AppSession().prefs.setString(PreferenceKey.LANGUAGE, languageDefault.countryName);
    }
    return S.load(localeDisplay);
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}