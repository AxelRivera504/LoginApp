import 'package:flutter/material.dart';

class AppTheme {
  static const _primary   = Color(0xFF337ae6);
  static const _secondary = Color(0xFFfdfefe);
  static const _tertiary  = Color(0xFF242627);

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: _primary,
          onPrimary: Colors.white,
          secondary: _secondary,
          onSecondary: Colors.white,
          tertiary: _tertiary,
          onTertiary: Colors.white,
          error: Color(0xFFB00020),
          onError: Colors.white,
          background: Color(0xFFF5F5F5),
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
      );
}
