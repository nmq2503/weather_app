import 'package:flutter/material.dart';

class ThemeCustom {
  static ThemeData themeLight = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.transparent,
    // textTheme: GoogleFonts.interTextTheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
  );
}