import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {
  static const Color primaryColor = Color(0xFF39A552);
  static ThemeData theme = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      toolbarHeight: 80,
      centerTitle: true,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
    ),
    textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF303030),
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.normal,
          color: const Color(0xFF79828B),
        ),
        titleLarge: GoogleFonts.exo(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF4F5A69),
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: const Color(0xFF42505C),
        )),
  );
}
