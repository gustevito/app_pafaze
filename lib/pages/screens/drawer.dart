import 'package:flutter/material.dart';
import 'package:myapp/pages/themes/darktheme.dart';

class DrawerAppBar extends StatelessWidget {
  const DrawerAppBar({super.key});

// login header (not functional yet)

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

          // note types list

          const ListTile(
              title: Text('Ferramentas',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),

          _widgetContainer(title: 'Notas rápidas', icon: Icons.bolt),
          _widgetContainer(title: 'Notas', icon: Icons.edit_note),
          _widgetContainer(title: 'Checklist', icon: Icons.checklist),
          _widgetContainer(title: 'Compras', icon: Icons.shopping_cart),
        ],
      ),
    );
  }

  _widgetContainer({required String title, required IconData icon}) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(10, 255, 255, 255),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: pzWhite,
            size: 24.0,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: pzWhite,
              ),
            ),
          ),
          const Icon(Icons.keyboard_arrow_right, color: pzWhite, size: 24),
        ],
      ),
    
      
    
    );
  }
}
