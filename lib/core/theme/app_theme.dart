import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        primaryColor: Colors.blue,
        brightness: Brightness.light,
        // Other theme properties
      );

  static ThemeData get dark => ThemeData(
        primaryColor: Colors.indigo,
        brightness: Brightness.dark,
        // Other theme properties
      );
}