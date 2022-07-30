// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors, must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ListOfTask extends StatefulWidget {
  String task;
  int index;
  ListOfTask({required this.task, required this.index});

  @override
  State<ListOfTask> createState() => _ListOfTaskState();
}

class _ListOfTaskState extends State<ListOfTask> {
  late Box box;
  bool isChecked = false;
  @override
  void initState() {
    super.initState();
    openBox();
  }

  Future openBox() async {
    box = await Hive.openBox("todos");
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: ListTile(
          onLongPress: () {
            box.deleteAt(widget.index);
          },
          title: Text(
            widget.task,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                decoration: isChecked ? TextDecoration.lineThrough : null),
          ),
          trailing: Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            activeColor: Colors.green[600],
            onChanged: (value) {
              setState(() {
                isChecked = !isChecked;
              });
            },
            value: isChecked,
          ),
        ),
      ),
    );
  }
}
