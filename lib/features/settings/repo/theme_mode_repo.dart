import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeRepository {
  static const String _darkMode = "isDarkMode";

  final SharedPreferences _preferences;

  ThemeModeRepository(this._preferences);

  Future<void> setDarkMode(bool value) async {
    _preferences.setBool(_darkMode, value);
  }

  bool isDarkMode() {
    return _preferences.getBool(_darkMode) ?? false;
  }
}
