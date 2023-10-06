import 'package:flutter/material.dart';

import '../themes/darktheme.dart';

class MyAppBar extends AppBar {
  MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: pzBlack,
      title: Text(
        'pafazê',
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 16.0,
        ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: Builder(builder: (context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(Icons.menu,
              color: Theme.of(context).colorScheme.primary, size: 25),
        );
      }),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.primary,
              size: 25,
            ))
      ],
    );
  }
}
