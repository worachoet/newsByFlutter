import 'package:flutter/material.dart';
import 'package:newsflutter/Theme/colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: white_color,
    primaryColor: primaryColor,
    errorColor: Colors.red,
    hoverColor: Colors.grey,
    appBarTheme: AppBarTheme(
        color: primaryColor, iconTheme: IconThemeData(color: textColorPrimary)),
    colorScheme:
        ColorScheme.light(primary: primaryColor, primaryVariant: primaryColor),
    cardTheme: CardTheme(color: Colors.white),
    iconTheme: IconThemeData(color: textColorPrimary),
    textTheme: TextTheme(
      button: TextStyle(color: primaryColor),
      headline6: TextStyle(color: textColorPrimary),
      subtitle2: TextStyle(color: textColorSecondary),
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
  );
}
