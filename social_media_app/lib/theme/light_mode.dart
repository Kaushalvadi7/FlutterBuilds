
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white, // Bright and clean surface
    primary: Colors.blue.shade500, // A vibrant primary color for accents
    secondary: Colors.orange.shade400, // A complementary secondary color
    inversePrimary: Colors.blueGrey.shade800, // Darker shade for inverse elements
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: Colors.grey[900], // Darker text for good contrast
    displayColor: Colors.grey[800], // Visible for headers
  ),
);


// import 'package:flutter/material.dart';
//
// ThemeData lightMode = ThemeData(
//   brightness: Brightness.light,
//   colorScheme: ColorScheme.light(
//       surface: Colors.grey.shade300,
//       primary: Colors.grey.shade200,
//       secondary: Colors.grey.shade400,
//       inversePrimary: Colors.grey.shade500,
//   ),
//   textTheme: ThemeData.light().textTheme.apply(
//       bodyColor: Colors.grey[800],
//       displayColor: Colors.black,
// ),
//
// );
