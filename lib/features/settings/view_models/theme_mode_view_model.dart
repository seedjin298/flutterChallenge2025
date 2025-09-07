import 'package:day15/features/settings/models/theme_mode_model.dart';
import 'package:day15/features/settings/repo/theme_mode_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeModeViewModel extends Notifier<ThemeModeModel> {
  final ThemeModeRepository _repository;

  ThemeModeViewModel(this._repository);

  void setDarkMode(bool value) {
    _repository.setDarkMode(value);
    state = ThemeModeModel(
      darkMode: state.darkMode,
    );
  }

  @override
  ThemeModeModel build() {
    return ThemeModeModel(
      darkMode: _repository.isDarkMode(),
    );
  }
}

final themeModeProvider = NotifierProvider<ThemeModeViewModel, ThemeModeModel>(
  () => throw UnimplementedError(),
);
