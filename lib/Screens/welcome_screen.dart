import 'package:afc_mobile_app/Screens/register_screen.dart';
import 'package:flutter/material.dart';
import './authentification_screen.dart';
import './form_screen.dart';
import './requirements_screen.dart';

class WelcomeScreen extends StatelessWidget {

  static const routeName = '/welcome-screen';

  Widget authentificationButton(Color buttonColor, String title, Color textColor, BuildContext ctx) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: buttonColor,
        onPressed: () {
          Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
            return AuthentificationScreen();
          }));
        },
        child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: textColor,),),
      ),
    );
  }

  Widget registerButton(Color buttonColor, String title, Color textColor, BuildContext ctx) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: buttonColor,
        onPressed: () {
          Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
            return RegisterScreen();
          }));
        },
        child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: textColor,),),
      ),
    );
  }

    Widget formButton(Color buttonColor, String title, Color textColor, BuildContext ctx) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: buttonColor,
        onPressed: () {
          Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
            return FormScreen();
          }));
        },
        child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: textColor,),),
      ),
    );
  }

  Widget requirementsButton(Color buttonColor, String title, Color textColor, BuildContext ctx) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: buttonColor,
        onPressed: () {
          Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
            return RequirementsScreen();
          }));
        },
        child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: textColor,),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1557683316-973673baf926?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE4fHx8ZW58MHx8fHw%3D&w=1000&q=80'),
                  fit: BoxFit.fill),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, left: 25),
                  child: Column(
                    children: [
                      Text('Hello', style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold, color: Colors.white),),
                      Text('Lorem ipsum dolor sit amet', style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.white),),
                    ],
                  ),
                ),),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    authentificationButton(Colors.indigo, 'Sign In', Colors.white, context),
                    requirementsButton(Colors.white, 'Sign Up', Colors.lightBlue, context),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
