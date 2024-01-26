// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BoxButton extends StatelessWidget {
  BoxButton({this.text, this.onPress});
  VoidCallback? onPress;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.green[700],
      onPressed: onPress,
      child: Text(
        text.toString(),
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
