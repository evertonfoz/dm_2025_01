import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: Colors.grey.shade100,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.deepPurple,
    elevation: 1,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    labelStyle: const TextStyle(color: Colors.deepPurple, fontSize: 16),
    hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 16),
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    enabledBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.redAccent),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Colors.deepPurple),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith<Color>(
        (states) =>
            states.contains(WidgetState.hovered)
                ? Colors.deepPurple.shade700
                : Colors.deepPurple,
      ),
      overlayColor: WidgetStateProperty.all(Colors.deepPurple.withAlpha(1)),
      textStyle: WidgetStateProperty.all(
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ),
  ),
);
