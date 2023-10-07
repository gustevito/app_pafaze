import 'package:flutter/material.dart';
import 'package:myapp/pages/widgets/appbar.dart';
import 'package:myapp/pages/screens/drawer.dart';

class MyShoppingList extends StatefulWidget {
  const MyShoppingList({super.key});

  @override
  State<MyShoppingList> createState() => _MyShoppingListState();
}

class _MyShoppingListState extends State<MyShoppingList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: DrawerAppBar(),
    );
  }
}