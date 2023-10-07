import 'package:flutter/material.dart';
import 'package:myapp/pages/widgets/appbar.dart';
import 'package:myapp/pages/screens/drawer.dart';

class MyNotes extends StatefulWidget {
  const MyNotes({super.key});

  @override
  State<MyNotes> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: DrawerAppBar(),
    );
  }
}
