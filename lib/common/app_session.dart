import 'package:flutter/material.dart';
import 'package:king_bank/constrants/preference_key.dart';
import 'package:king_bank/data/model/language_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSession {
  String token;
  String languageSelect;

  static final AppSession _shared = new AppSession._internal();
  SharedPreferences prefs;

  factory AppSession() {
    return _shared;
  }

  AppSession._internal() {
    init();
  }

  Future init() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString(PreferenceKey.TOKEN);
    if (prefs.containsKey(PreferenceKey.LANGUAGE)) {
      languageSelect = prefs.getString(PreferenceKey.LANGUAGE);
    }
  }

  bool isUserLogin() {
    return token != null;
  }

  logout() {
    token = null;
    prefs.clear();
  }

  List<Language> languageList = [
    Language("English", Locale('en', '')),
    Language("Tiếng Việt", Locale('vi', '')),
    Language("한국어", Locale('ko', '')),
    Language("日本語", Locale('jp', '')),
    Language("繁體中文", Locale('zh', '')),
    Language("Русский", Locale('ru', '')),
    Language("Español", Locale('es', '')),
    Language("Française", Locale('fr', '')),
    Language("Deutsch", Locale('de', '')),
    Language("Türkçe", Locale('tr', '')),
    Language("Nederland", Locale('nl', '')),
    Language("Português", Locale('pt', '')),
    Language("Italilano", Locale('it', '')),
    Language("Poski", Locale('pl', '')),
    Language("Indonesian", Locale('id', '')),
  ];

}