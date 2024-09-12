import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_x_app/StartHomeScreen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var textFieldEmailAddressController = TextEditingController();
  var textFieldPasswordController = TextEditingController();
  late SharedPreferences sharedPreferences;

  void initSharedPreferences() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    initSharedPreferences();
    return Material(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Column(
          children: <Widget>[
            Text(
              'Login',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: TextField(
                controller: textFieldEmailAddressController,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Enter Email',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.black))),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: TextField(
                controller: textFieldPasswordController,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    hintText: 'Enter Password',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.black))),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: (){
                      sharedPreferences.setBool('isLoggedIn', true);
                      sharedPreferences.setString('email', textFieldEmailAddressController.text);
                      sharedPreferences.setString('password', textFieldPasswordController.text);
                      Navigator.pop(context);
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> StartHomeScreen()));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
