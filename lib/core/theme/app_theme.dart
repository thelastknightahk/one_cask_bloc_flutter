import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF122329);
  static const Color secondary = Color(0xFFFFFFFF);
  static const Color accent = Color(0xFFD49A00);
  static const Color secondaryPrimaryColor = Color(0xff0E1C21);
  static const Color blackColor = Color(0xff0B1519);
  static const Color greyColor = Color(0xffB8BDBF);
  static const Color greyLightColor = Color(0xffE7E9EA);
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primary,
      scaffoldBackgroundColor: secondary,
      appBarTheme: AppBarTheme(
        backgroundColor: primary,
        foregroundColor: secondary,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: primary),
        bodyMedium: TextStyle(color: primary),
        labelLarge: TextStyle(color: accent),
      ),
      colorScheme: ColorScheme.light(
        primary: primary,
        secondary: accent,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primary,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: primary,
        foregroundColor: secondary,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: secondary),
        bodyMedium: TextStyle(color: secondary),
        labelLarge: TextStyle(color: accent),
      ),
      colorScheme: ColorScheme.dark(
        primary: primary,
        secondary: accent,
      ),
    );
  }
}
