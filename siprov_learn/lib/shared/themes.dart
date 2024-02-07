import 'package:siprov_learn/shared/color_scheme.g.dart';
import 'package:flutter/material.dart';

ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      colorScheme: lightScheme,
      brightness: Brightness.light,
      appBarTheme: _appBarTheme(lightScheme),
      textTheme: _textTheme(lightScheme),
      drawerTheme: _drawerTheme(lightScheme),
      dividerTheme: _dividerThemeData(lightScheme),
      cardTheme: _cardTheme(lightScheme),
      inputDecorationTheme: _inputDecorationTheme(lightScheme),
      elevatedButtonTheme: _elevatedButtonThemeData(lightScheme),      
    );

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      colorScheme: darkScheme,
      brightness: Brightness.dark,
      appBarTheme: _appBarTheme(darkScheme),
      textTheme: _textTheme(darkScheme),
      drawerTheme: _drawerTheme(darkScheme),
      dividerTheme: _dividerThemeData(darkScheme),
      cardTheme: _cardTheme(darkScheme),
      inputDecorationTheme: _inputDecorationTheme(darkScheme),
      elevatedButtonTheme: _elevatedButtonThemeData(darkScheme),
    );

AppBarTheme _appBarTheme(ColorScheme colorScheme) {
  return AppBarTheme(
    backgroundColor: colorScheme.primary,
    foregroundColor: colorScheme.onPrimary,
    centerTitle: true,
    toolbarHeight: 90,
    iconTheme: IconThemeData(
      color: colorScheme.onPrimary,
    ),
    actionsIconTheme: IconThemeData(
      color: colorScheme.onPrimary,
    ),
  );
}

TextTheme _textTheme(ColorScheme colorScheme) {
  return TextTheme(
    headlineSmall: TextStyle(
      fontSize: 16,
      color: colorScheme.onPrimary,
    ),
    headlineMedium: TextStyle(
      fontSize: 16,
      color: colorScheme.onPrimary,
    ),
    headlineLarge: TextStyle(
      fontSize: 22,
      color: colorScheme.onPrimary,
    ),
    bodySmall: TextStyle(
      fontSize: 16,
      color: colorScheme.secondary,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: colorScheme.primary,
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      color: colorScheme.primary,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: 32,
      color: colorScheme.onSurface,
      fontWeight: FontWeight.bold,
    ),            
  );
}

DrawerThemeData _drawerTheme(ColorScheme colorScheme) {
  return DrawerThemeData(backgroundColor: lightScheme.primary, width: 350);
}

DividerThemeData _dividerThemeData(ColorScheme colorScheme) {
  return DividerThemeData(
    color: colorScheme.primary,
  );
}

CardTheme _cardTheme(ColorScheme colorScheme) {
  return CardTheme(
    color: colorScheme.surface,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(color: colorScheme.primary, width: 1, style: BorderStyle.solid),
    ),
  );
}

InputDecorationTheme _inputDecorationTheme(ColorScheme colorScheme) {
  return InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: colorScheme.primary,
        width: 1,
        style: BorderStyle.solid,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: colorScheme.primary,
        width: 1,
        style: BorderStyle.solid,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: colorScheme.primary,
        width: 1,
        style: BorderStyle.solid,
      ),
    ),
  );
}

ElevatedButtonThemeData _elevatedButtonThemeData(ColorScheme colorScheme) {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(colorScheme.secondary),
      foregroundColor: MaterialStateProperty.all(colorScheme.onSecondary),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}
