import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  appBarTheme: const AppBarTheme(
    color: Colors.blue,
  ),
  // Устанавливаем глобальный стиль для всех Text
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 24.0, // Начальный размер шрифта
      color: const Color.fromARGB(
          255, 112, 112, 112), // Цвет шрифта для обычного текста
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  appBarTheme: const AppBarTheme(
    color: Colors.black,
  ),
  // Устанавливаем глобальный стиль для всех Text
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 24.0, // Начальный размер шрифта
      color: Colors.white, // Цвет шрифта для обычного текста
    ),
  ),
);