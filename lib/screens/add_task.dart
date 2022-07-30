// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, must_be_immutable, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddTodos extends StatefulWidget {
  @override
  State<AddTodos> createState() => _AddTodosState();
}

class _AddTodosState extends State<AddTodos> {
  late String todo;
  late Box box;
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
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Add Todos",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                onChanged: (value) {
                  todo = value;
                },
                autofocus: true,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.lightBlueAccent,
                  ),
                ),
                onPressed: () {
                  box.add(todo);
                  Navigator.pop(context);
                },
                child: Text(
                  "Add",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
