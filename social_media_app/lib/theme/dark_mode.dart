import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900, // Dark background for surface elements
    primary: Colors.teal.shade300, // Vibrant teal for primary accents
    secondary: Colors.amber.shade300, // Warm amber for secondary highlights
    inversePrimary: Colors.grey.shade200, // Lighter shade for inverse elements
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: Colors.grey[200], // Lighter text for better contrast
    displayColor: Colors.white, // White for headers and emphasized text
  ),
);


//
// import 'package:flutter/material.dart';
//
// ThemeData darkMode = ThemeData(
//   brightness: Brightness.dark,
//   colorScheme: ColorScheme.dark(
//     surface: Colors.grey.shade300,
//     primary: Colors.grey.shade200,
//     secondary: Colors.grey.shade400,
//     inversePrimary: Colors.grey.shade800,
//   ),
//   textTheme: ThemeData.dark().textTheme.apply(
//     bodyColor: Colors.grey[300],
//     displayColor: Colors.black,
//   ),
// );
