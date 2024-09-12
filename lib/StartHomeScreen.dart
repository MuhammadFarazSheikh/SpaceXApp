
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_x_app/HomeScreen.dart';

class StartHomeScreen extends StatelessWidget {
  StartHomeScreen({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Material(
      child: HomeScreen(),
    );
  }
}