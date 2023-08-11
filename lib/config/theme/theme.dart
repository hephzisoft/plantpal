import 'package:flutter/material.dart';

import '../colors.dart';
import 'text_theme.dart';

class AppTheme {
  static var apptheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'poppins',
    focusColor: Colors.grey,
    textTheme: AppTextTheme.textTheme,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: primaryColor,
      background: Colors.white,
      secondary: Colors.red,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: AppTextTheme.textTheme.titleMedium!.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        letterSpacing: 3,
        fontSize: 20,
      ),
    ),
    // inputDecorationTheme:
    //     const InputDecorationTheme(outlineBorder: Colors.green)
  );
}
