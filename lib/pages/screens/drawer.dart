import 'package:flutter/material.dart';
import 'package:myapp/pages/themes/darktheme.dart';

class DrawerAppBar extends StatelessWidget {
  const DrawerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: pzBlack),
            accountName: Text('John Doe'),
            accountEmail: Text('johndoe@gmail.com'),
          ),
        ],
      ),
    );
  }
}
