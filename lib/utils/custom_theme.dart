import 'package:flutter/material.dart';
import 'package:petcare/utils/custom_colors.dart';

class CustomThemeData {
  ThemeData themeData() {
    return ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: CustomColors.primaryColor,
          textStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
