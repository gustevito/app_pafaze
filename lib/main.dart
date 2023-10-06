import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/pages/themes/darktheme.dart';
import 'pages/screens/quicknotes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: const QuickNotes(),
    );
  }
}
