// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_app/box_button.dart';

class BoxDialog extends StatelessWidget {
  BoxDialog({this.controller, this.onSave, this.onCancel});
  VoidCallback? onSave;
  VoidCallback? onCancel;

  final controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: controller,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add new task here",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BoxButton(
                  onPress: onCancel,
                  text: "Cancel",
                ),
                BoxButton(
                  onPress: onSave,
                  text: "Add",
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
