import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

GlobalKey appGlobalKey = GlobalKey();

class Global {
  final SharedPreferences _prefs;

  static late final Global _instance;

  static Global getInstance() => _instance;

  static Future<void> init(SharedPreferences prefs) async {
    _instance = Global._(prefs);
  }

  Global._(this._prefs);

  Locale? _locale;
  String? _jsonResponse;
  Locale get locale {
    if (_locale == null) {
      final _localeString = _prefs.getString("LocaleString");
      _locale = _createLocale(_localeString);
    }
    return _locale ?? "en-US" as Locale;
  }

  set localeString(String? localeString) {
    _locale = _createLocale(localeString);

    _prefs.setString("LocaleString", localeString ?? "en-US");
  }

  String get localeString {
    return _prefs.getString("LocaleString") ?? "en-US";
  }

  Locale _createLocale(String? localeString) {
    if (localeString == null) {
      return Locale("en", "US");
    }
    final languageCode = localeString.split("-")[0];
    final regionCode = localeString.split("-")[1];
    return Locale(languageCode, regionCode);
  }

  set jsonString(String? jsonString) {
    _jsonResponse = jsonString;
    _prefs.setString("JsonString", jsonString!);
  }

  String? get jsonString {
    return _prefs.getString("JsonString");
  }
}
