import 'package:flutter/material.dart';

import '../colors.dart';
import 'text_theme.dart';

class AppTheme {
  static var apptheme = ThemeData(
    useMaterial3: true,
    textTheme: AppTextTheme.textTheme,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: primaryColor,
    )
  );
}
