import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Color(0xFF0F367C)),
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    textTheme: TextTheme(headline1: TextStyle(color: Colors.black)),
    accentColor: Colors.orange,
    cardColor: Colors.white);
ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    textTheme: TextTheme(headline1: TextStyle(color: Colors.white)),
    primarySwatch: Colors.orange,
    accentColor: Colors.blue,
    cardColor: Colors.black,
    scaffoldBackgroundColor: Colors.black);

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences _prefs;
  bool _darkTheme;
  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(key, _darkTheme);
  }
}
