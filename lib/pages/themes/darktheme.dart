import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pages/constants/colors.dart';

ThemeData darkTheme = ThemeData(
    textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(fontSize: 26),
        displayMedium: GoogleFonts.poppins(fontSize: 18),
        displaySmall: GoogleFonts.poppins(fontSize: 14)),
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: pzGrey,
      primary: Colors.white,
      secondary: pzBlack,
    )
    
    );
