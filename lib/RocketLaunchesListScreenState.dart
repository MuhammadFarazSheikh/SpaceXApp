
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_x_app/ApiCallsHandler.dart';
import 'package:space_x_app/RocketLaunchesListScreen.dart';
import 'package:space_x_app/RocketList.dart';
import 'package:space_x_app/RocketsListUI.dart';

class RocketLaunchesListScreenState extends State<RocketLaunchesListScreen> {

  late ApiCallsHandler apiCallsHandler;
  late Future<List<RocketList>> future;

  @override
  void initState() {
    apiCallsHandler = new ApiCallsHandler();
    future = apiCallsHandler.getSpaceXRocketList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context,snapshot)
        {
          if(snapshot.hasData)
          {
            return new RocketsListUI(list: snapshot.data!);
          }
          return Center(
            child: CircularProgressIndicator(
              color: Colors.grey,
              strokeWidth: 5,
            ),
          );
        }
    );
  }
}