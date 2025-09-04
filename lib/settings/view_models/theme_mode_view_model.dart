import 'package:day15/settings/models/theme_mode_model.dart';
import 'package:day15/settings/repo/theme_mode_repo.dart';
import 'package:flutter/material.dart';

class ThemeModeViewModel extends ChangeNotifier {
  final ThemeModeRepository _repository;

  late final ThemeModeModel _model = ThemeModeModel(
    darkMode: _repository.isDarkMode(),
  );

  ThemeModeViewModel(this._repository);

  bool get darkMode => _model.darkMode;

  void setDarkMode(bool value) {
    _repository.setDarkMode(value);
    _model.darkMode = value;
    notifyListeners();
  }
}
