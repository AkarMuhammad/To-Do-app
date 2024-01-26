// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, must_be_immutable
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  TodoTile({this.taskName, this.value, this.onChange, this.deleteFunction});
  String? taskName;
  bool? value;
  var deleteFunction;
  Function(bool? value)? onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            label: "Delete",
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Checkbox(
                value: value,
                onChanged: onChange,
                activeColor: Colors.black,
              ),
              Text(
                taskName.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: value == true
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationThickness: 2.3,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 44, 139, 47),
              borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }
}
