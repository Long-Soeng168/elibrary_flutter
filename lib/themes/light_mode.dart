import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Color(0xFFf6f6ff),
    primary: Color(0xFF7a6bbc),
    // secondary: Colors.orange.shade400,
    // tertiary: Colors.grey.shade100,
    inversePrimary: Color.fromARGB(255, 188, 173, 255),
  )
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    // background: Colors.grey.shade800,
    // primary: Colors.blue.shade400,
    // secondary: Color(0xFFFFA726),
    // tertiary: Colors.grey.shade100,
    // inversePrimary: Colors.grey.shade700,
  )
);