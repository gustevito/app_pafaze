import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myapp/pages/screens/drawer.dart';
import 'package:myapp/pages/widgets/add.dart';
import 'package:myapp/pages/themes/darktheme.dart';

import '../widgets/todo.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final Text _notePlaceholder = Text();

  final TextEditingController _controller = TextEditingController();
  final List<String> _notes = [];

  // adicionar nota
  void _incrementNote() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        _notes.add(_controller.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _noteContainer = [];

    if (_notes.isNotEmpty) {
      _noteContainer.add(const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Text(
              'Notas',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ));
    }

    // nota
    for (var e in _notes) {
      _noteContainer.add(TodoWidget(
        message: e,
      ));
    }

    return Scaffold(
      backgroundColor: pzGrey,
      drawer: const DrawerAppBar(),
      appBar: AppBar(
        backgroundColor: pzBlack,
        title: Text(
          widget.title,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_noteContainer.isEmpty) ...[
              Padding(
                padding: EdgeInsets.fromLTRB(
                    60, MediaQuery.sizeOf(context).height / 2.5, 60, 0),
                child: const Text(
                  'Adicione a sua primeira nota para visualizá-la aqui!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(125, 255, 255, 255), fontSize: 18),
                ),
              ),
            ] else
              ..._noteContainer,
            /*Text(
              '$_notePlaceholder',
              style: Theme.of(context).textTheme.displayLarge,
            ),*/
          ],
        ),
      ),
      /* bottomNavigationBar: Container(
        color: pzBlack,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
              backgroundColor: pzBlack,
              color: pzWhite,
              activeColor: pzWhite,
              tabBackgroundColor: pzGrey,
              gap: 8,
              padding: EdgeInsets.all(10),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'home',
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'favorite',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'search',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'settings',
                ),
              ]),
        ),
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? result = await showModalBottomSheet<String>(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTodo(),
              );
            },
          );
          debugPrint('f8787 - $result');
          _controller.text = result ?? '';
          _incrementNote();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
