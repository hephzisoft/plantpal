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
      backgroundColor: primaryColor,
      titleTextStyle: AppTextTheme.textTheme.titleMedium!.copyWith(
        color: Colors.white,
      ),
    ),
    // inputDecorationTheme:
    //     const InputDecorationTheme(outlineBorder: Colors.green)
  );
}
