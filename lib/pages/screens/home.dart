import 'package:flutter/material.dart';
import 'package:myapp/pages/screens/add.dart';
import 'package:myapp/pages/themes/darktheme.dart';

import 'todo.dart';

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

  void _incrementNote() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        _notes.add(_controller.text);
      }
    });
  }

  Widget _widgetMessage(String messageText) {
    return Container(color: Colors.green, child: Text(messageText));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _noteContainer = [];

    if (_notes.length > 0) {
      _noteContainer.add(Row(
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

    for (var e in _notes) {
      _noteContainer.add(TodoWidget(
        message: e,
      ));
    }

    return Scaffold(
      backgroundColor: pzGrey,
      appBar: AppBar(
          backgroundColor: pzBlack,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.menu,
                color: Theme.of(context).colorScheme.primary,
                size: 25,
              ),
              Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 16.0,
                ),
              ),
              Icon(
                Icons.more_vert,
                color: Theme.of(context).colorScheme.primary,
                size: 25,
              )
            ],
          )),
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
