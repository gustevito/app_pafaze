import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/checklist_controller.dart';
import 'package:myapp/pages/themes/darktheme.dart';

import '../../models/checklist_model.dart';

class TodoWidget extends StatefulWidget {
  ChecklistModel checklistModel;

  TodoWidget({super.key, required this.checklistModel});

  @override
  State<TodoWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TodoWidget>
    with SingleTickerProviderStateMixin {
  bool? isChecked = false;
  late AnimationController _controller;
  ChecklistController checklistController = Get.put(ChecklistController());

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
    int number = 0;
    return Dismissible(
        key: Key(widget.checklistModel.id.toString()),
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: CheckboxListTile(
            title: Text(
              widget.checklistModel.message,
              style: const TextStyle(color: pzWhite, fontSize: 16),
            ),
            value: widget.checklistModel.checked,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool? newValue) {
              setState(() {
                widget.checklistModel.checked = newValue ?? false;
                checklistController.setChecked(widget.checklistModel);
                isChecked = newValue;
              });
            },
            activeColor: pzWhite,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            tileColor: Color.fromARGB(10, 255, 255, 255),
          ),
        ));
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