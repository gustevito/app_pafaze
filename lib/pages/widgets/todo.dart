import 'package:flutter/material.dart';
import 'package:myapp/pages/themes/darktheme.dart';

class TodoWidget extends StatefulWidget {
  String message;

  TodoWidget({super.key, required this.message});

  @override
  State<TodoWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TodoWidget>
    with SingleTickerProviderStateMixin {
  bool? isChecked = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: CheckboxListTile(
        title: Text(
          widget.message,
          style: const TextStyle(color: pzWhite, fontSize: 16),
        ),
        value: isChecked,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (bool? newValue) {
          setState(() {
            isChecked = newValue;
          });
        },
        activeColor: pzWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: Color.fromARGB(10, 255, 255, 255),
      ),
    );
  }
}



/*Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Color.fromARGB(10, 255, 255, 255),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              Text(
                widget.message,
                style: const TextStyle(color: pzWhite, fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );*/