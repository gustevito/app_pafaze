import 'package:flutter/material.dart';
import 'package:myapp/pages/widgets/appbar.dart';
import 'package:myapp/pages/screens/drawer.dart';

class MyQuickNotes extends StatefulWidget {
  const MyQuickNotes({super.key});

  @override
  State<MyQuickNotes> createState() => _MyQuickNotesState();
}

class _MyQuickNotesState extends State<MyQuickNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: DrawerAppBar(),
    );
  }
}
