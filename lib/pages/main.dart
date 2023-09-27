import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants/colors.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
            displayLarge: GoogleFonts.poppins(fontSize: 26),
            displayMedium: GoogleFonts.poppins(fontSize: 18),
            displaySmall: GoogleFonts.poppins(fontSize: 14)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'pafaze'),
    );
  }
}
