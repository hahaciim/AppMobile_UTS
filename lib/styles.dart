// styles.dart
import 'package:flutter/material.dart';

class AppColors {
  static const darkGrey = Color(0xFF635C5C);
  static const darkBlue = Color(0xFF004AAD); // Primary color for buttons, etc.
  static const accentBlue = Color(0xFF004AAD); // Accent color for highlights
}

class TextStyles {
  static TextStyle title = const TextStyle(
    fontFamily: 'Outfit',
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
    color: AppColors.darkGrey,
  );

  static TextStyle body = const TextStyle(
    fontFamily: 'Outfit',
    fontWeight: FontWeight.normal,
    fontSize: 16.0,
    color: AppColors.darkGrey,
  );
}
