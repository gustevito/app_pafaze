import 'package:flutter/material.dart';
import 'package:myapp/pages/themes/darktheme.dart';

class AddTodo extends StatefulWidget {
  AddTodo({super.key});

  @override
  State<AddTodo> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AddTodo>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: pzBlack,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Escreva o que você tem pafazê'),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                controller: _controller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: ElevatedButton(
                child: const Text('Adicionar nota'),
                onPressed: () => Navigator.pop(context, _controller.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
