// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/box_dialog.dart';
import 'package:todo_app/todo_tile.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  //my List
  List<Map<String, dynamic>> myList = [
    {"text": "first task", 'isDone': false},
    {"text": "first task", 'isDone': false},
  ];
  //click check box
  void checkBoxChange(bool? value, int index) {
    setState(() {
      myList[index]['isDone'] = !myList[index]['isDone'];
    });
  }

  //add new task
  void addNewTask() {
    setState(() {
      myList.add({'text': myController.text, 'isDone': false});
      Navigator.pop(context);
      myController.clear();
    });
  }

  //create new task
  final myController = TextEditingController();
  void creteNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return BoxDialog(
          controller: myController,
          onSave: () {
            addNewTask();
          },
          onCancel: () {
            myController.clear();
            Navigator.pop(context);
          },
        );
      },
    );
  }

  //dlete task
  void deleteFunction(int index) {
    setState(() {
      myList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TODO APP',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[900],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          creteNewTask();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        backgroundColor: Color.fromARGB(255, 36, 190, 47),
      ),
      body: ListView.builder(
        itemCount: myList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: myList[index]['text'],
            value: myList[index]['isDone'],
            onChange: (value) {
              checkBoxChange(value, index);
            },
            deleteFunction: (context) {
              deleteFunction(index);
            },
          );
        },
      ),
    );
  }
}
