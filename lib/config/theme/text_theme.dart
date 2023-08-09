import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';

class AppTextTheme {
  static var textTheme = TextTheme(
    titleMedium: GoogleFonts.poppins(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: primaryColor,
    ),
    titleSmall: GoogleFonts.poppins(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: primaryColor,
    ),
  );
}
