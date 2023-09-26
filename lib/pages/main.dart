import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants/colors.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
            displayLarge: GoogleFonts.poppins(fontSize: 26),
            displayMedium: GoogleFonts.poppins(fontSize: 18),
            displaySmall: GoogleFonts.poppins(fontSize: 14)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
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
