
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_x_app/ApiCallsHandler.dart';
import 'package:space_x_app/SpaceXDetailsScreen.dart';
import 'package:space_x_app/SpaceXInformation.dart';
import 'package:url_launcher/url_launcher.dart';

class SpaceXDetailsScreenState extends State<SpacexDetailscreen> {

  late Future<SpaceXInformation> future;
  late ApiCallsHandler apicallshandler;

  @override
  void initState() {
    apicallshandler = new ApiCallsHandler();
    future = apicallshandler.getSpaceXInformation();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SpaceXInformation>(
        future: future,
        builder: (context,snapshot)
        {
          if (snapshot.hasData) {
            return Column(
                children: <Widget>[
                  Container(
                    color: Colors.grey,
                    alignment: AlignmentDirectional.center,
                    width: double.infinity,
                    child: Text(
                      'SpaceX Company',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Name = '+snapshot.data!.name!),
                        Text('Founder = '+snapshot.data!.founder!),
                        Text('Founded = '+snapshot.data!.founded!.toString())
                      ]
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Employees = '+snapshot.data!.employees!.toString()),
                      Text('Vehicles = '+snapshot.data!.vehicles!.toString()),
                      Text('Launch Sites = '+snapshot.data!.launch_sites!.toString())
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Test Sites = '+snapshot.data!.test_sites!.toString()),
                      Text('CEO = '+snapshot.data!.ceo!),
                      Text('CTO = '+snapshot.data!.cto!)
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('COO = '+snapshot.data!.coo!),
                      Text('CTO Propulsion = '+snapshot.data!.cto_propulsion!)
                    ],
                  ),
                  Text('Valuation = '+snapshot.data!.valuation!.toString()),
                  Container(
                    color: Colors.grey,
                    alignment: AlignmentDirectional.center,
                    width: double.infinity,
                    child: Text(
                      'Headquarters',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Address = '+snapshot.data!.headquarters!.address!),
                      Text('City = '+snapshot.data!.headquarters!.city!),
                      Text('State = '+snapshot.data!.headquarters!.state!)
                    ],
                  ),
                  Container(
                    color: Colors.grey,
                    alignment: AlignmentDirectional.center,
                    width: double.infinity,
                    child: Text(
                      'Links',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                          child: Text('Website'),
                          onTap: () => launchUrl(Uri.parse('https://www.spacex.com/'))
                      ),
                      InkWell(
                          child: Text('Flickr'),
                          onTap: () => launchUrl(Uri.parse('https://www.flickr.com/photos/spacex/'))
                      ),
                      InkWell(
                          child: Text('Twitter'),
                          onTap: () => launchUrl(Uri.parse('https://twitter.com/SpaceX'))
                      ),
                      InkWell(
                          child: Text('Elon Twitter'),
                          onTap: () => launchUrl(Uri.parse('https://twitter.com/elonmusk'))
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.grey,
                    alignment: AlignmentDirectional.center,
                    width: double.infinity,
                    child: Text(
                      'Summary',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(snapshot.data!.summary!),
                  )
                ],
              );
          }
          // By default, show a loading spinner.
          return Center(
            child: CircularProgressIndicator(
              color: Colors.grey,
              strokeWidth: 5,
            ),
          );
        },
      );
  }
}