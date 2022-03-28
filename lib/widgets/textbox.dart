import 'package:flutter/material.dart';

Widget userInput(TextEditingController userInput, String hintTitle,
    TextInputType keyboardType, pid) {
  return Container(
    width: 300,
    height: 40,
    margin: EdgeInsets.only(bottom: 15),
    decoration: BoxDecoration(
        // color: Color.fromARGB(255, 29, 211, 126),
        borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: TextField(
        cursorColor: Colors.green,
        controller: userInput,
        decoration: InputDecoration(
          hintText: hintTitle,

          prefixIcon: Icon(
            pid,
            size: 20,
            color: Colors.green,
          ) ,
          filled:true,
          enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.green)
          ),
          hintStyle: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontStyle: FontStyle.italic),
        ),
        keyboardType: keyboardType,
      ),
    ),
  );
}
