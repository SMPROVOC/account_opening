import 'package:flutter/material.dart';

Widget radioInput(TextEditingController userInput, int _value) {
  return Container(
    color: Colors.amber,
    width: 300,
    height: 40,
    child: Row(
      children: [
        Radio(
            value: 1,
            groupValue: _value,
            onChanged: (value) {           
            }),Text("Married"),

        Text("Married"),
        SizedBox(width: 10.0),
        Radio(value: 1, groupValue: _value, onChanged: (value) {}),
        Text("Single"),
        SizedBox(width: 10.0),
        Radio(value: 1, groupValue: _value, onChanged: (value) {}),
        Text("Ingaged"),
      ],
    ),
  );
}
