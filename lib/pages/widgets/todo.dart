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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(16, 5, 16, 5),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(31, 255, 255, 255),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.note,
                color: pzWhite,
                size: 24.0,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  widget.message,
                  style: const TextStyle(
                    color: pzWhite,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
