import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

registerUser(String name, String email, String password) async {
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': '<Your token>'
  };

  Map data = {
    'name': name,
    'email': email,
    'password': password,
    'password_confirmation': password
  };

  //encode Map to JSON
  var body = json.encode(data);

  final response = await http.post(
      Uri.parse('https://payments.agribank.co.zw/api/register'),
      headers: requestHeaders,
      body: body);
  //await http.get(Uri.parse('http://192.168.0.41:9999/api/transactions'));
  //await http.post(Uri.parse('http://192.168.0.41:9999/api/customers'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //return Album.fromJson(jsonDecode(response.body));
    print(response.statusCode);

    //Map<String, dynamic> data =
    //  new Map<String, dynamic>.from(json.decode(response.body));

    //print(data['message']);

    //var msg = data['response']['first_name'].toString();

    //_myService.incrementMyVariable();

    //var responseData = json.decode(response.body);

    //print(responseData);
    //Creating a list to store input data;

    // for (var singleUser in responseData) {
    //   print(singleUser.response['first_name']);
    // }

    // for (var i = 0; i < 0; i++) {
    //   print(responseData[1]);
    // }

  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    //throw Exception('Failed to load album');
    //showAlertDialog(context,"hie");
    print(response.body);
  }
}

showAlertDialog(BuildContext context, String f) {
  // Create button
  Widget okButton = FlatButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    content: Text(f),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialog2(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Network Error"),
    content: Text("Please check your internet connetion"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
