import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const seedColor = Colors.indigoAccent;

class AppTheme {

  final bool isDarkMode;

  AppTheme({
    this.isDarkMode = false,
  });

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: seedColor,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    listTileTheme: const ListTileThemeData(
      iconColor: seedColor,
    ),
    fontFamily: GoogleFonts.montserratAlternates().fontFamily,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: seedColor,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
        fontFamily: GoogleFonts.montserratAlternates().fontFamily,
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

}