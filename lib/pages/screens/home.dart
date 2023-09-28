import 'package:flutter/material.dart';
import 'package:myapp/pages/constants/colors.dart';
import 'package:myapp/pages/themes/darktheme.dart';

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
    for (var e in _notes) {
      _noteContainer.add(_widgetMessage(e));
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
                size: 30,
              ),
              Text(widget.title),
              Icon(
                Icons.more_vert,
                color: Theme.of(context).colorScheme.primary,
                size: 30,
              )
            ],
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_noteContainer.isEmpty) ...[
              const Text(
                  'Adicione a sua primeira nota para visualizá-la aqui!'),
            ] else
              ..._noteContainer,
            TextField(
              controller: _controller,
            ),
            Text(
              'You have pushed the button this many times:',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            /*Text(
              '$_notePlaceholder',
              style: Theme.of(context).textTheme.displayLarge,
            ),*/
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementNote,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
