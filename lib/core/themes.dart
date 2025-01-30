import 'package:flutter/material.dart';

class AppThemes {
  // Açık Tema
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color.fromARGB(255, 204, 141, 187),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 204, 141, 187),
      foregroundColor: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
  );

  // Koyu Tema
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color.fromRGBO(255, 204, 141, 187),
    scaffoldBackgroundColor: Color.fromARGB(255, 25, 25, 25), // Siyah arka plan
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 40, 40, 40),
      foregroundColor: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
  );
}
