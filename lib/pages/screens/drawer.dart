import 'package:flutter/material.dart';
import 'package:myapp/pages/themes/darktheme.dart';

class DrawerAppBar extends StatelessWidget {
  const DrawerAppBar({super.key});

// lista de notas experimental! posteriormente irei acrescentar aprimoramentos no código
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: pzBlack),
            accountName: Text('John Doe'),
            accountEmail: Text('johndoe@gmail.com'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(15, 255, 255, 255),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.bolt,
                    color: pzWhite,
                    size: 24.0,
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      'Notas rápidas',
                      style: TextStyle(
                        color: pzWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(15, 255, 255, 255),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.edit_note,
                  color: pzWhite,
                  size: 24.0,
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    'Notas',
                    style: TextStyle(
                      color: pzWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(15, 255, 255, 255),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: pzWhite,
                  size: 24.0,
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    'Compras',
                    style: TextStyle(
                      color: pzWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
