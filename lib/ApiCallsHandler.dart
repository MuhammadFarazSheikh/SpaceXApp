
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:space_x_app/RocketList.dart';
import 'package:space_x_app/SpaceXInformation.dart';

class ApiCallsHandler
{
  Future<SpaceXInformation> getSpaceXInformation() async {
    final response = await http.get(Uri.parse('https://api.spacexdata.com/v3/info'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      log(response.body);
      return SpaceXInformation.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<List<RocketList>> getSpaceXRocketList() async {
    final response = await http.get(Uri.parse('https://api.spacexdata.com/v3/launches'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      log(response.body);
      return (jsonDecode(response.body) as List).cast<Map<String, dynamic>>().map<RocketList>((json) => RocketList.fromJson(json)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}