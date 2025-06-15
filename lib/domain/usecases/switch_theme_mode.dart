import 'package:flutter/material.dart';

import '../entities/theme_mode_type.dart';

class SwitchThemeModeUseCase {
  ThemeModeType toggle(ThemeModeType current) {
    return current == ThemeModeType.light
        ? ThemeModeType.dark
        : ThemeModeType.light;
  }

  ThemeMode getFlutterThemeMode(ThemeModeType type) {
    return type == ThemeModeType.dark ? ThemeMode.dark : ThemeMode.light;
  }
}