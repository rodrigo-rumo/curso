import 'package:flutter/material.dart';

ColorScheme _lightColorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF3F3E40),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFCBE6FF),
  onPrimaryContainer: Color(0xFF001E30),
  secondary: Color(0xff1DCBDE),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFFDF9F),
  onSecondaryContainer: Color(0xFF261A00),
  tertiary: Color(0xFF006D3A),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFF74FCA5),
  onTertiaryContainer: Color(0xFF00210E),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFCFCFF),
  onBackground: Color(0xFF1A1C1E),
  surface: Color(0xFFFFFFFF),
  onSurface: Color(0xFF3F3E40),
  surfaceVariant: Color(0xFFDDE3EA),
  onSurfaceVariant: Color(0xFF41474D),
  outline: Color(0xFF72787E),
  onInverseSurface: Color(0xFFF0F0F3),
  inverseSurface: Color(0xFF2E3133),
  inversePrimary: Color(0xFF8ECDFF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF006494),
  outlineVariant: Color(0xFFC1C7CE),
  scrim: Color(0xFF000000),
);

ColorScheme _darkColorScheme = const ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF3F3E40),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFCBE6FF),
  onPrimaryContainer: Color(0xFF001E30),
  secondary: Color(0xff1DCBDE),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFFDF9F),
  onSecondaryContainer: Color(0xFF261A00),
  tertiary: Color(0xFF006D3A),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFF74FCA5),
  onTertiaryContainer: Color(0xFF00210E),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFCFCFF),
  onBackground: Color(0xFF1A1C1E),
  surface: Color(0xFFFFFFFF),
  onSurface: Color(0xFF1A1C1E),
  surfaceVariant: Color(0xFFDDE3EA),
  onSurfaceVariant: Color(0xFF41474D),
  outline: Color(0xFF72787E),
  onInverseSurface: Color(0xFFF0F0F3),
  inverseSurface: Color(0xFF2E3133),
  inversePrimary: Color(0xFF8ECDFF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF006494),
  outlineVariant: Color(0xFFC1C7CE),
  scrim: Color(0xFF000000),
);

ColorScheme get lightScheme => _lightColorScheme;

set lightScheme(ColorScheme light) {
  _lightColorScheme = light;
}

ColorScheme get darkScheme => _darkColorScheme;

set darkScheme(ColorScheme dark) {
  _darkColorScheme = dark;
}
