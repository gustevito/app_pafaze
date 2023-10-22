import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color pzRed = Color(0xFFDA4040); // Error and functions
const Color pzGreen = Color(0xFF3ABB29); // Authorizations and other functions

const Color pzBlack = Color.fromARGB(255, 34, 34, 34); // Navbar
const Color pzGrey = Color.fromARGB(255, 48, 48, 48); // Background
const Color pzGrey1 = Color.fromARGB(0, 24, 24, 24);

const Color pzYellow = Color(0xFFF3C048);
const Color pzWhite = Color(0xFFFFFFFF);
const Color pzWhite1 = Color.fromARGB(165, 255, 255, 255);

ThemeData darkTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: pzGrey,
      primary: Colors.white,
      secondary: pzBlack,
      tertiary: pzGrey1,
    ));
