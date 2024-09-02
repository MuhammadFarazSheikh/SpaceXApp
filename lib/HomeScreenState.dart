import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_x_app/HomeScreen.dart';
import 'package:space_x_app/RocketLaunchesListScreen.dart';
import 'package:space_x_app/SpaceXDetailsScreen.dart';

class HomeScreenState extends State<HomeScreen> {

  int bottomNavigationCurrentIndex = 0;
  List<Widget> bottomNavigationScreens = [
    SpacexDetailscreen(),
    RocketLaunchesListScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavigationScreens[bottomNavigationCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavigationCurrentIndex,
        onTap: (index){
          setState((){
            bottomNavigationCurrentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.details),
              label: 'SpaceXDetails'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'RocketsList'
          )
        ],
      ),
    );
  }
}
