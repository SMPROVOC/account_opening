import 'package:afc_mobile_app/widgets/popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

sendData(String name, String email, String password) async {
  // Map<String, String> requestHeaders = {
  //   'Content-type': 'application/json',
  //   'Accept': 'application/json',
  //   'Authorization': '<Your token>'
  // };

  // Map data = {
  //   'first_name': 'Eddie',
  //   'last_name': 'Tome',
  //   'gender': 'Male',
  //   'marital_status': 'Single',
  //   'date_of_birth': '12/02/2022',
  //   'full_address': '1234 house address test',
  //   'msisdn': '772334321',
  //   'country_of_birth': 'Zimbabwe',
  //   'citizenship': 'Zimbabwean',
  //   'ocupation': 'Farmer',
  //   'gross_income': '24363',
  //   'contact_person': 'This is the contact person',

  // };

  // //encode Map to JSON
  // var body = json.encode(data);

  // final response = await http.post(
  //     Uri.parse('https://payments.agribank.co.zw/api/register'),
  //     headers: requestHeaders,
  //     body: body);
  // //await http.get(Uri.parse('http://192.168.0.41:9999/api/transactions'));
  // //await http.post(Uri.parse('http://192.168.0.41:9999/api/customers'));

  // if (response.statusCode == 200) {
  //   // If the server did return a 200 OK response,
  //   // then parse the JSON.
  //   //return Album.fromJson(jsonDecode(response.body));
  //   print(response.statusCode);

  //   //Map<String, dynamic> data =
  //   //  new Map<String, dynamic>.from(json.decode(response.body));

  //   //print(data['message']);

  //   //var msg = data['response']['first_name'].toString();

  //   //_myService.incrementMyVariable();

  //   //var responseData = json.decode(response.body);

  //   //print(responseData);
  //   //Creating a list to store input data;

  //   // for (var singleUser in responseData) {
  //   //   print(singleUser.response['first_name']);
  //   // }

  //   // for (var i = 0; i < 0; i++) {
  //   //   print(responseData[1]);
  //   // }

  // } else {
  //   // If the server did not return a 200 OK response,
  //   // then throw an exception.
  //   //throw Exception('Failed to load album');
  //   //showAlertDialog(context,"hie");
  //   print(response.body);
  // }

  // var x = File("images/original.png").existsSync();
  // if (x) {
  //   print('here');
  // } else {
  //   print(x);
  // }

  // var postUri = Uri.parse("http://192.168.0.41:9999/api/customers");

  // http.MultipartRequest request = new http.MultipartRequest("POST", postUri);

  // http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
  //     'original.png', 'images/');

  // request.files.add(multipartFile);

  // http.StreamedResponse response = await request.send();

  // print(response.statusCode);
  var postUri = Uri.parse("http://192.168.0.41:9999/api/customers");
  var filePath = "images/original.png";
  //var name = 'original.png';

  http.MultipartRequest request = new http.MultipartRequest("POST", postUri);

  // http.MultipartFile multipartFile =
  //     await http.MultipartFile.fromPath('image', filePath);

  // var img = http.MultipartFile.fromBytes('image',
  //     (await rootBundle.load('assets/images')).buffer.asUint8ClampedList(),
  //     filename: 'img1.png');

  request.headers['Accept'] = 'application/json';

  request.fields["first_name"] = 'Eddie';
  request.fields["last_name"] = 'Tome';
  request.fields["gender"] = 'Male';
  request.fields["marital_status"] = 'Single';
  request.fields["full_address"] = 'My address';
  request.fields["date_of_birth"] = '21/01/1999';
  request.fields["msisdn"] = '077554632';
  request.fields["country_of_birth"] = 'Zimbabwe';
  request.fields["citizenship"] = 'Zimbabwe';
  request.fields["ocupation"] = 'Farmer';
  request.fields["gross_income"] = '1284742883';
  request.fields["contact_person"] = 'This is the contact person';
  request.fields["legal"] = '23-48734734 S 33';
  request.fields["description"] = 'Description';

  request.files.addAll([
    http.MultipartFile.fromBytes(
      'profile_photo',
      File(filePath).readAsBytesSync(),
      filename: filePath,
    ),
    http.MultipartFile.fromBytes(
      'scanned_id_or_passport',
      File(filePath).readAsBytesSync(),
      filename: filePath,
    ),
    http.MultipartFile.fromBytes(
      'aditional_documents',
      File(filePath).readAsBytesSync(),
      filename: filePath,
    ),
  ]);

  //   'first_name': 'Eddie',
  //   'last_name': 'Tome',
  //   'gender': 'Male',
  //   'marital_status': 'Single',
  //   'date_of_birth': '12/02/2022',
  //   'full_address': '1234 house address test',
  //   'msisdn': '772334321',
  //   'country_of_birth': 'Zimbabwe',
  //   'citizenship': 'Zimbabwean',
  //   'ocupation': 'Farmer',
  //   'gross_income': '24363',
  //   'contact_person': 'This is the contact person',

  //http.StreamedResponse response = await request.send();
  var streamedResponse = await request.send();

  var response = await http.Response.fromStream(streamedResponse);

  print(response.statusCode);
  print(response.body);
}


// submitCustomerData(String first_name, String last_name, int gender, int marital_status, String full_address, var date_of_birth,
//     String msisdn, String country_of_birth, var citizenship, String ocupation, var gross_income, String contact_person, String legal,
//     String description, var proPicPath, var scannedDocPath, var additionalDocPath) async {
//
//   var postUri = Uri.parse("http://192.168.0.41:9999/api/customers");
// //var filePath = "images/original.png";
//
//   String gen = "Null"; // for gender
//   String maritalStatus = "Null"; // for marital status
//
//     if (gender == 3){
//       gen = "male";
//     }else if (gender == 4){
//       gen = "female";
//     }else{
//       gen = "Null";
//     }
//
//   if (marital_status == 5){
//     maritalStatus = "single";
//     }else if (marital_status == 6){
//       maritalStatus = "married";
//     }else{
//     maritalStatus = "Null";
//   }
//
//
//
//
//
//   print(first_name.runtimeType);
//   print(last_name.runtimeType);
//   print(gen.runtimeType);
//   print(maritalStatus.runtimeType);
//   print(full_address.runtimeType);
//   print(date_of_birth.runtimeType);
//   print(msisdn.runtimeType);
//   print(country_of_birth.runtimeType);
//   print(citizenship.runtimeType);
//   print(ocupation.runtimeType);
//   print(gross_income.runtimeType);
//   print(contact_person.runtimeType);
//   print(legal.runtimeType);
//   print(description.runtimeType);
//   print(proPicPath.runtimeType);
//   print(scannedDocPath.runtimeType);
//   print(additionalDocPath.runtimeType);
//
//
//
//
//
//   // http.MultipartRequest request = new http.MultipartRequest("POST", postUri);
//   //
//   // request.headers['Accept'] = 'application/json';
//   //
//   // request.fields["first_name"] = first_name;
//   // request.fields["last_name"] = last_name;
//   // request.fields["gender"] = gen;
//   // request.fields["marital_status"] = maritalStatus;
//   // request.fields["full_address"] = full_address;
//   // request.fields["date_of_birth"] = date_of_birth;
//   // request.fields["msisdn"] = msisdn;
//   // request.fields["country_of_birth"] = country_of_birth;
//   // request.fields["citizenship"] = citizenship;
//   // request.fields["ocupation"] = ocupation;
//   // request.fields["gross_income"] = gross_income;
//   // request.fields["contact_person"] = contact_person;
//   // request.fields["legal"] = legal;
//   // request.fields["description"] = description;
//   //
//   // request.files.addAll([
//   //   http.MultipartFile.fromBytes(
//   //     'profile_photo',
//   //     File(proPicPath).readAsBytesSync(),
//   //     filename: proPicPath,
//   //   ),
//   //   http.MultipartFile.fromBytes(
//   //     'scanned_id_or_passport',
//   //     File(scannedDocPath).readAsBytesSync(),
//   //     filename: scannedDocPath,
//   //   ),
//   //   http.MultipartFile.fromBytes(
//   //     'aditional_documents',
//   //     File(additionalDocPath).readAsBytesSync(),
//   //     filename: additionalDocPath,
//   //   ),
//   // ]);
//   //
//   // var streamedResponse = await request.send();
//   //
//   // var response = await http.Response.fromStream(streamedResponse);
//   //
//   // print(response.statusCode);
//   // print(response.body);
//   return "success";
// }




