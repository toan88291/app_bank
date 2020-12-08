import 'package:flutter/material.dart';
import 'package:king_bank/common/app_session.dart';
import 'package:king_bank/data/model/language_model.dart';

Locale getLocaleByCountry(String country) {
  if (country == null || country.isEmpty) {
    return Locale('en', '');
  }
  for (var item in AppSession().languageList) {
    if (item.countryName == country) {
      return item.locale;
    }
  }
  return Locale('en', '');
}

Language getLocaleByCode(String code) {
  if (code == null || code.isEmpty) {
    return AppSession().languageList[0];
  }
  for (var item in AppSession().languageList) {
    if (item.locale.languageCode == code) {
      return item;
    }
  }
  return AppSession().languageList[0];
}