import 'package:shared_preferences/shared_preferences.dart';

import '../core/constant.dart';

class Prefs {

  final SharedPreferences prefs;

  Prefs(this.prefs);

  bool getThemeMode() {
    return prefs.getBool(themeKey)??false;
  }

  void setThemeMode(bool isDarkMode) async {
     prefs.setBool(themeKey, isDarkMode);
  }
}