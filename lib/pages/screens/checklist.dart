import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/pages/widgets/appbar.dart';
import 'package:myapp/pages/screens/drawer.dart';
import 'package:myapp/pages/widgets/add.dart';
import 'package:myapp/pages/themes/darktheme.dart';

import '../../controllers/application_controller.dart';
import '../widgets/todo.dart';

class MyCheckList extends StatefulWidget {
  

  const MyCheckList({super.key});

  @override
  State<MyCheckList> createState() => _MyCheckListState();
}

class _MyCheckListState extends State<MyCheckList> {
  //final Text _notePlaceholder = Text();
  ApplicationController applicationController =
      Get.put(ApplicationController());
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
  void initState() {
    // TODO: implement initState
    super.initState();
    applicationController.setPageSelected(PageOptions.pgChecklist);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _noteContainer = [];

    if (_notes.isNotEmpty) {
      _noteContainer.add(const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 10),
            child: Text(
              'Checklist',
              style: TextStyle(
                fontSize: 26,
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
      appBar: MyAppBar(),
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



