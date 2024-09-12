
import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_x_app/LoginScreen.dart';
import 'package:space_x_app/StartHomeScreen.dart';

class SplashScreen extends StatelessWidget {

  SplashScreen({super.key});

  late Timer timer;
  int count = 3;
  late SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SpaceXApp',
      home: Scaffold(
        body: Builder(
          builder: (context)
          {
            initSharedPreferences();
            startTimer(context);
            return Center(
              child: Text(
                'SpaceX',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void initSharedPreferences() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  void startTimer(BuildContext context)
  {
    timer = new Timer.periodic(
        new Duration(seconds: 1),
        (Timer timer)
        {
          if(count==0)
            {
              timer.cancel();
              if(sharedPreferences!=null
                  && sharedPreferences.containsKey("isLoggedIn")
                  && sharedPreferences.getBool("isLoggedIn")!
              ) {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StartHomeScreen()));
              }
              else
              {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              }
            }
          else
            {
              --count;
            }
        }
    );
  }
}
