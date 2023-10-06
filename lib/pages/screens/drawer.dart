import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/pages/screens/notes.dart';
import 'package:myapp/pages/screens/quicknotes.dart';
import 'package:myapp/pages/themes/darktheme.dart';

import '../../controllers/application_controller.dart';

class DrawerAppBar extends StatefulWidget {
  const DrawerAppBar({super.key});

  @override
  _DrawerAppBarState createState() => _DrawerAppBarState();
}

class _DrawerAppBarState extends State<DrawerAppBar> {
  ApplicationController applicationController =
      Get.put(ApplicationController());
  bool isScreenSelected = false; // Variável para controlar o estado da seleção

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
          const ListTile(
              title: Text('Ferramentas',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
          _widgetContainer(
            title: 'Notas rápidas',
            icon: Icons.bolt,
            onTap: () {
              if (applicationController.getPageSelected() ==
                  PageOptions.pgQuickNotes) {
                Navigator.pop(context);
              } else {
                applicationController.setPageSelected(PageOptions.pgQuickNotes);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuickNotes(),
                  ),
                );
              }
            },
          ),
          _widgetContainer(
            title: 'Notas',
            icon: Icons.edit_note,
            onTap: () {
              if (applicationController.getPageSelected() ==
                  PageOptions.pgNotes) {
                Navigator.pop(context);
              } else {
                applicationController.setPageSelected(PageOptions.pgNotes);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyNotes()));
              }
              // Executar ação apenas se a tela não estiver selecionada
              // Coloque sua lógica aqui
            },
          ),
          _widgetContainer(
            title: 'Checklist',
            icon: Icons.checklist,
            onTap: () {
              if (!isScreenSelected) {
                // Executar ação apenas se a tela não estiver selecionada
                // Coloque sua lógica aqui
              }
            },
          ),
          _widgetContainer(
            title: 'Compras',
            icon: Icons.shopping_cart,
            onTap: () {
              if (!isScreenSelected) {
                // Executar ação apenas se a tela não estiver selecionada
                // Coloque sua lógica aqui
              }
            },
          ),
        ],
      ),
    );
  }

  _widgetContainer(
      {required String title,
      required IconData icon,
      required Function onTap}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          setState(() {
            // Defina isScreenSelected para true quando um container for pressionado
            isScreenSelected = true;
          });
          onTap();
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
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
        ),
      ),
    );
  }
}
