import 'package:afc_mobile_app/widgets/app_text.dart';
import 'package:afc_mobile_app/widgets/popup.dart';
import 'package:flutter/material.dart';
import 'package:afc_mobile_app/widgets/app_large_text.dart';
import 'package:afc_mobile_app/widgets/responsive_button.dart';
import 'package:afc_mobile_app/widgets/textbox.dart';
import 'package:afc_mobile_app/widgets/checkboxs.dart';
import 'package:afc_mobile_app/Post_functions/data_post.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class RequirementsScreen extends StatefulWidget {
  const RequirementsScreen({Key? key}) : super(key: key);

  @override
  State<RequirementsScreen> createState() => _RequirementsScreenState();
}

class _RequirementsScreenState extends State<RequirementsScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final citizenshipController = TextEditingController();
  final contactPersonController = TextEditingController();
  final countryOfBirthController = TextEditingController();
  late DateTime? _dobController;
  final occupationController = TextEditingController();
  final grossIcomeController = TextEditingController();
  final descriptionController = TextEditingController();
  final contactNumberController = TextEditingController();
  final nationalIdController = TextEditingController();
  final fullAddressController = TextEditingController();
  PickedFile? _imageFileProfilePic;
  PickedFile? _imageFileAdditionalDoc;
  PickedFile? _imageFileScannedIdOrPassport;
  final _picker = ImagePicker();
  DateTime date = DateTime(2005, 01, 01);
  final items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
  ];

  int _value = 1;
  int _value2 = 1;
  String? _dropDownValue;

  List images = [
    "tractor2.png",
    "farmer6.png",
    "farmer6.png",
    "tractor2.png",
    "farmer4.png",
    "tractor2.png",
  ];

  List bold_text = [
    "Get started",
    "1/5",
    "2/5",
    "3/5",
    "4/5",
    "5/5",
  ];

  List normal_text = [
    "With a Flexi Cash Account",
    "About yourself",
    "Additional",
    "Additional",
    "Upload files here",
    "All set!",
  ];

  List small_text = [
    "Below is just a few of what we require...",
    "Please provide us with your details",
    "Range",
    "Identification",
    "Tap on the camera icon.",
    "Cross check fields before sending!",
  ];

  List hide_for_textSetA = [false, true, false, false, false, false];

  List hide_for_textSetB = [false, false, true, false, false, false];

  List hide_for_textSetC = [false, false, true, false, false, false];

  List hide_for_textSetD = [false, false, false, true, false, false];

  List hide_for_textSetE = [false, false, false, false, true, false];

  List hide_for_textSetF = [false, false, false, false, false, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/" + images[index]),
                      fit: BoxFit.cover)),
              child: Container(
                margin: EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: bold_text[index]),
                        AppText(
                          text: normal_text[index],
                          size: 20,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 250,
                          child: AppText(
                            text: small_text[index],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Visibility(
                          visible: hide_for_textSetA[index],

                          child: Container(

                            width: 320,
                            height: 320,
                            // color: Colors.amber,
                            child: Column(

                              children: [
                                userInput(firstNameController, 'first_name',
                                    TextInputType.text, Icons.verified_user),
                                userInput(lastNameController, 'last_name',
                                    TextInputType.text, Icons.verified_user),
                                userInput(contactNumberController, 'contact_number (263...)',
                                    TextInputType.number, Icons.verified_user),
                                // userInput(
                                //     dobController, 'DOB', TextInputType.text),

                                Text('${date.year}/${date.month}/${date.year}'),
                                ElevatedButton(
                                    onPressed: () async {
                                      DateTime? newDate = await showDatePicker(
                                          context: context,
                                          initialDate: date,
                                          firstDate: DateTime(1910),
                                          lastDate: DateTime(2300));

                                      //if (newDate == null) return;

                                      if (newDate == null) return;

                                      setState(() => date = newDate);

                                      setState(() => _dobController = newDate);
                                    },
                                    child: Text('Select date')),

                                SizedBox(height: 10,),

                                DropdownButton(
                                  hint: _dropDownValue == null
                                      ? Text('Citizenship')
                                      : Text(
                                          _dropDownValue!,
                                          style: TextStyle(color: Colors.green),
                                        ),
                                  isExpanded: true,
                                  iconSize: 30.0,
                                  style: TextStyle(color: Colors.green),
                                  items: [
                                    'Zimbabwean',
                                    'South African',
                                    'Other'
                                  ].map(
                                    (val) {
                                      return DropdownMenuItem<String>(
                                        value: val,
                                        child: Text(val),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (val) {
                                    setState(
                                      () {
                                        _dropDownValue = val as String?;
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: hide_for_textSetC[index],
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(width: 20.0),
                                Text("Gender:"),
                                SizedBox(width: 32.0),
                                Radio(
                                    value: 3,
                                    groupValue: _value,
                                    onChanged: (value) {
                                      setState(() {
                                        // _value = value;
                                        setState(() => _value = value as int);
                                      });
                                    }),
                                Text("Male"),
                                SizedBox(width: 10.0),
                                Radio(
                                    value: 4,
                                    groupValue: _value,
                                    onChanged: (value) {
                                      setState(() {
                                        //_value = _value;
                                        setState(() => _value = value as int);
                                      });
                                    }),
                                Text("Female"),
                                SizedBox(width: 10.0),
                              ],
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        Visibility(
                          visible: hide_for_textSetC[index],
                          child: Container(
                            child: Row(
                              children: [
                                Text("Marital Status:"),
                                SizedBox(width: 10.0),
                                Radio(
                                    value: 5,
                                    groupValue: _value2,
                                    onChanged: (value) {
                                      setState(() {
                                        // _value = value;
                                        setState(() => _value2 = value as int);
                                      });
                                    }),
                                Text("Single"),
                                SizedBox(width: 10.0),
                                Radio(
                                    value: 6,
                                    groupValue: _value2,
                                    onChanged: (value) {
                                      setState(() {
                                        //_value = _value;
                                        setState(() => _value2 = value as int);
                                      });
                                    }),
                                Text("Married"),
                                SizedBox(width: 10.0),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Visibility(
                          visible: hide_for_textSetC[index],
                          child: Container(
                            width: 320,
                            height: 300,
                            // color: Colors.amber,
                            child: Column(
                              children: [
                                userInput(nationalIdController,
                                    'nationa_id', TextInputType.text, Icons.phone_android),
                                userInput(contactPersonController,
                                    'contact_person', TextInputType.text, Icons.phone_android),
                                userInput(countryOfBirthController,
                                    'country of birth', TextInputType.text, Icons.monitor_heart),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: hide_for_textSetD[index],
                          child: Container(
                            width: 320,
                            height: 300,
                            // color: Colors.amber,
                            child: Column(
                              children: [
                                userInput(fullAddressController, 'full_address',
                                    TextInputType.text, Icons.shopping_bag),
                                userInput(occupationController, 'occupation',
                                    TextInputType.text, Icons.shopping_bag),
                                userInput(grossIcomeController, 'gross_income',
                                    TextInputType.number, Icons.money),
                                userInput(descriptionController, 'description',
                                    TextInputType.text, Icons.description),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: hide_for_textSetE[index],

                          child: Container(
                            width: 340,
                            height: 82,
                            color: Colors.green,




                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (builder) => bottomSheet());
                              },
                              child: Row(
                                children: [iconPic(),
                                  SizedBox(width: 20,),
                                  AppText(text: "Profile photo", size: 20, color: Colors.black),],

                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 10,),

                        Visibility(
                          visible: hide_for_textSetE[index],
                          child: Container(
                            width: 320,
                            height: 80,
                            color: Colors.green,
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (builder) => bottomSheet2());
                              },

                              child: Row(
                                children: [iconPic2(),
                                  SizedBox(width: 20,),
                                  AppText(text: "Scanned Passport/Id", size: 20, color: Colors.black),
                                  // Text("Scanned Passport/Id"),
                                  ],

                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),

                        Visibility(
                          visible: hide_for_textSetE[index],
                          child: Container(
                            width: 300,
                            height: 80,
                            color: Colors.green,
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (builder) => bottomSheet3());
                              },
                              child: Row(
                                children: [iconPic3(),
                                  SizedBox(width: 20,),
                                  AppText(text: "Additional files", size: 20, color: Colors.black),],

                              ),
                            ),
                          ),

                        ),

                        Visibility(
                          visible: hide_for_textSetF[index],
                          child: Container(
                            width: 200,
                            height: 40,
                            color: Colors.green,
                            child: TextButton(
                              onPressed: () {
                                //print(firstNameController.text);
                                //print(lastNameController.text);
                                //print(_dropDownValue);
                                //print(contactPersonController.text);
                                //print(countryOfBirthController.text);
                                //print(_dobController);
                                //print(occupationController.text);
                                //print(grossIcomeController.text);
                                //print(descriptionController.text);
                                //print(_value);
                                //print(_value2);
                                //print(FileImage(File(_imageFileProfilePic!.path)));
                                //print(FileImage(File(_imageFileScannedIdOrPassport!.path)));
                                //print(FileImage(File(_imageFileAdditionalDoc!.path)));
                                //print(contactNumberController.text);
                                //print(nationalIdController.text);
                                //print(fullAddressController.text);
                                // print(_imageFileProfilePic);
                                // print(_imageFileScannedIdOrPassport);
                                // print(_imageFileAdditionalDoc);



                                if (firstNameController.text.isEmpty){
                                  submitionError(context, 'First name field in page 1 cannot be empyt!');
                                }else if(lastNameController.text.isEmpty){
                                  submitionError(context, 'Last name field in page 1 cannot be empyt!');
                                }else if(contactNumberController.text.isEmpty){
                                  submitionError(context, 'Contact number field in page 1 cannot be empyt!');
                                }else if(_dropDownValue == null){
                                  submitionError(context, 'Citizenship field in page 1 cannot be empyt!');
                                }else if(_value == 1){
                                  submitionError(context, 'Gender section in page 2 cannot be empyt!');
                                }else if(_value2 == 1){
                                  submitionError(context, 'Marital status in page 2 cannot be empyt!');
                                }else if(nationalIdController.text.isEmpty){
                                  submitionError(context, 'National Id field in page 2 cannot be empyt!');
                                }else if(contactPersonController.text.isEmpty){
                                  submitionError(context, 'Contact person field in page 2 cannot be empyt!');
                                }else if(countryOfBirthController.text.isEmpty){
                                  submitionError(context, 'Country of birth field in page 2 cannot be empyt!');
                                }else if(fullAddressController.text.isEmpty){
                                  submitionError(context, 'Address field in page 3 cannot be empyt!');
                                }else if(occupationController.text.isEmpty){
                                  submitionError(context, 'Occupation field in page 3 cannot be empyt!');
                                }else if(grossIcomeController.text.isEmpty){
                                  submitionError(context, 'Gross income field in page 3 cannot be empyt!');
                                }else if(descriptionController.text.isEmpty){
                                  submitionError(context, 'Description field in page 2 cannot be empyt!');
                                }

                                try {

                                if (_dobController == null){
                                  submitionError(context, 'Date of birth field in page 2 cannot be empyt!');
                                };
                                } on Exception catch (exception) {
                                  // only executed if error is of type Exception
                                submitionError(context, 'Date of birth field in page 2 cannot be empyt!');
                                } catch (error) {
                                // executed for errors of all types other than Exception
                                  submitionError(context, 'Date of birth field in page 1 cannot be empyt!');
                                }

                                try {
                                  if (_imageFileProfilePic == null){
                                    submitionError(context, 'Profile photo image in page 4 cannot be empyt!');
                                  };
                                } on Exception catch (exception) {
                                  // only executed if error is of type Exception
                                  submitionError(context, 'Profile photo image in page 4 cannot be empyt!');
                                } catch (error) {
                                  // executed for errors of all types other than Exception
                                  submitionError(context, 'Date of birth image in page 4 cannot be empyt!');
                                }

                                try {
                                  if (_imageFileScannedIdOrPassport == null){
                                    submitionError(context, 'Id or passport image in page 4 cannot be empyt!');
                                  };
                                } on Exception catch (exception) {
                                  // only executed if error is of type Exception
                                  submitionError(context, 'Id or passport image in page 4 cannot be empyt!');
                                } catch (error) {
                                  // executed for errors of all types other than Exception
                                  submitionError(context, 'Id pr passport image in page 4 cannot be empyt!');
                                }


                                try {
                                  if (_imageFileAdditionalDoc == null){
                                    submitionError(context, 'Additional files image in page 4 cannot be empyt!');
                                  };
                                } on Exception catch (exception) {
                                  // only executed if error is of type Exception
                                  submitionError(context, 'Additional files image in page 4 cannot be empyt!');
                                } catch (error) {
                                  // executed for errors of all types other than Exception
                                  submitionError(context, 'Additional files image in page 4 cannot be empyt!');
                                }


                           submitCustomerData(firstNameController.text, lastNameController.text, _value, _value2, fullAddressController.text, _dobController,
                                    contactNumberController.text, countryOfBirthController.text, _dropDownValue, occupationController.text, grossIcomeController.text,
                                    contactPersonController.text, nationalIdController.text, descriptionController.text, _imageFileProfilePic!.path.toString(),
                                    _imageFileScannedIdOrPassport!.path.toString(), _imageFileAdditionalDoc!.path).toString();



                              },
                              child: Text(
                                'Send',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }




//################### For profile picture ##########################
  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFileProfilePic = pickedFile!;
    });
  }

  Widget iconPic() {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius:40.0,
          backgroundImage: _imageFileProfilePic == null? AssetImage("assets/images/farmer3.png") as ImageProvider: FileImage(File(_imageFileProfilePic!.path)),
        ),
        Positioned(bottom:10.0, right:8.0, child:Icon(Icons.camera_alt, color: Colors.teal, size: 28.0)),

      ],);
  }
//############################################################################



  //################### For scanned Id or passport ##########################
  void takePhoto2(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFileScannedIdOrPassport = pickedFile!;
    });
  }

  Widget iconPic2() {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius:40.0,
          backgroundImage: _imageFileScannedIdOrPassport == null? AssetImage("assets/images/farmer3.png") as ImageProvider: FileImage(File(_imageFileScannedIdOrPassport!.path)),
        ),
        Positioned(bottom:10.0, right:8.0, child:Icon(Icons.camera_alt, color: Colors.teal, size: 28.0)),

      ],);
  }
//############################################################################



  //################### For additional documents ##########################
  void takePhoto3(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFileAdditionalDoc = pickedFile!;
    });
  }

  Widget iconPic3() {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius:40.0,
          backgroundImage: _imageFileAdditionalDoc == null? AssetImage("assets/images/farmer3.png") as ImageProvider: FileImage(File(_imageFileAdditionalDoc!.path)),
        ),
        Positioned(bottom:10.0, right:8.0, child:Icon(Icons.camera_alt, color: Colors.teal, size: 28.0)),

      ],);
  }
//############################################################################


//################### bottomSheet for take photo #############

  Widget bottomSheet() {
    return Container(
      width: 200,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(children: <Widget>[
        Text(
          "Choose Profile Photo",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              label: Text("Camera"),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              label: Text("Gallary"),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
            ),
          ],
        )
      ]),
    );
  }
  //###############################################################


//################### bottomSheet for take photo #############

  Widget bottomSheet2() {
    return Container(
      width: 200,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(children: <Widget>[
        Text(
          "Choose Profile Photo",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              label: Text("Camera"),
              onPressed: () {
                takePhoto2(ImageSource.camera);
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              label: Text("Gallary"),
              onPressed: () {
                takePhoto2(ImageSource.gallery);
              },
            ),
          ],
        )
      ]),
    );
  }
//###############################################################



//################### bottomSheet for take photo #############

  Widget bottomSheet3() {
    return Container(
      width: 200,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(children: <Widget>[
        Text(
          "Choose Profile Photo",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              label: Text("Camera"),
              onPressed: () {
                takePhoto3(ImageSource.camera);
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              label: Text("Gallary"),
              onPressed: () {
                takePhoto3(ImageSource.gallery);
              },
            ),
          ],
        )
      ]),
    );
  }
//###############################################################




//#################################send  customer data ######################################

  submitCustomerData(String first_name, String last_name, int gender, int marital_status, String full_address, var date_of_birth,
      String msisdn, String country_of_birth, var citizenship, String ocupation, String gross_income, String contact_person, String legal,
      String description, var proPicPath, var scannedDocPath, var additionalDocPath) async {

    var postUri = Uri.parse("http://192.168.0.41:9999/api/customers");
//var filePath = "images/original.png";

    String gen = "Null"; // for gender
    String maritalStatus = "Null"; // for marital status

    if (gender == 3){
      gen = "male";
    }else if (gender == 4){
      gen = "female";
    }else{
      gen = "Null";
    }


    if (marital_status == 5){
      maritalStatus = "single";
    }else if (marital_status == 6){
      maritalStatus = "married";
    }else{
      maritalStatus = "Null";
    }

    DateFormat dateFormat = DateFormat("yyyy-MM-dd");

    String dt = dateFormat.format(date_of_birth);



    http.MultipartRequest request = new http.MultipartRequest("POST", postUri);

    request.headers['Accept'] = 'application/json';

    request.fields["first_name"] = first_name;
    request.fields["last_name"] = last_name;
    request.fields["gender"] = gen;
    request.fields["marital_status"] = maritalStatus;
    request.fields["full_address"] = full_address;
    request.fields["date_of_birth"] = dt;
    request.fields["msisdn"] = msisdn;
    request.fields["country_of_birth"] = country_of_birth;
    request.fields["citizenship"] = citizenship;
    request.fields["ocupation"] = ocupation;
    request.fields["gross_income"] = gross_income;
    request.fields["contact_person"] = contact_person;
    request.fields["legal"] = legal;
    request.fields["description"] = description;

    request.files.addAll([
      http.MultipartFile.fromBytes(
        'profile_photo',
        File(proPicPath).readAsBytesSync(),
        filename: proPicPath,
      ),
      http.MultipartFile.fromBytes(
        'scanned_id_or_passport',
        File(scannedDocPath).readAsBytesSync(),
        filename: scannedDocPath,
      ),
      http.MultipartFile.fromBytes(
        'aditional_documents',
        File(additionalDocPath).readAsBytesSync(),
        filename: additionalDocPath,
      ),
    ]);

    var streamedResponse = await request.send();

    var response = await http.Response.fromStream(streamedResponse);

    print(response.statusCode);
    print(response.body);

    var responseData = json.decode(response.body);

    print(responseData);
    //Creating a list to store input data;


    //print(responseData['message']);


    var res = responseData['message'];



    String country_code= msisdn.substring(0,3);



    if (first_name.isEmpty){
      res = "null";
    }else if(last_name.isEmpty) {
      res = "null";
    }else if(gender == 1) {
      res = "null";
    }else if(marital_status == 1){
      res = "null";
    }else if(full_address.isEmpty){
      res = "null";
    }else if(date_of_birth == null){
      res = "null";
    }else if(msisdn.isEmpty){
      res = "null";
    }else if(country_of_birth.isEmpty){
      res = "null";
    }else if(citizenship == null){
      res = "null";
    }else if(ocupation.isEmpty){
      res = "null";
    }else if(gross_income.isEmpty) {
      res = "null";
    }else if(contact_person.isEmpty){
      res = "null";
    }else if(legal.isEmpty){
      res = "null";
    }else if(description.isEmpty){
      res = "null";
    }else if(proPicPath == null){
      res = "null";
    }else if(scannedDocPath == null){
      res = "null";
    }else if(additionalDocPath == null){
      res = "null";
    }else if(country_code != "263") {
      submitionError(
          context, "Your contact number must be in the format 263*********");
      res = "null";
    }else if(msisdn.length < 12){
      submitionError(context, "Your contact number is short in numbers check it again!");
      res = "null";
    }else if(msisdn.length > 12){
      submitionError(context, "Your contact number has too many numbers check it again!");
      res = "null";
    };


    int contact_number = int.parse(msisdn);
    int income = int.parse(gross_income);






    // print(first_name.runtimeType);
    // print(last_name.runtimeType);
    // print(gen.runtimeType);
    // print(maritalStatus.runtimeType);
    // print(full_address.runtimeType);
    // print(date_of_birth.runtimeType);
    // print(contact_number.runtimeType);
    // print(country_of_birth.runtimeType);
    // print(citizenship.runtimeType);
    // print(ocupation.runtimeType);
    // print(income.runtimeType);
    // print(contact_person.runtimeType);
    // print(legal.runtimeType);
    // print(description.runtimeType);
    // print(proPicPath);
    // print(scannedDocPath.runtimeType);
    // print(additionalDocPath);






    if (res == "Successfully Posted") {
      submitSuccessAlert(context,
          "Information for " + first_name + " " + last_name +
              " is sumbitted for processing");

      firstNameController.clear();
      lastNameController.clear();
      _value =  1;
      _value2 = 1;
      fullAddressController.clear();
      _dobController = null;
      contactNumberController.clear();
      countryOfBirthController.clear();
      _dropDownValue = null;
      occupationController.clear();
      grossIcomeController.clear();
      contactPersonController.clear();
      nationalIdController.clear();
      descriptionController.clear();
      _imageFileProfilePic = null;
      _imageFileScannedIdOrPassport = null;
      _imageFileAdditionalDoc = null;


    }else if (res == "Failed to Upload Customer KYC Details, Possible Duplicate"){
      submitionError(context, 'Possible Duplication of record in system. Verify if this record does not already exist with AFC.');
      }else{
      submitionError(context, res);
    }

  }

}
