
import 'package:space_x_app/RocketListLinks.dart';

class RocketList
{
  int? flight_number;
  String? mission_name;
  String? launch_year;
  String? launch_date_utc;
  bool? launch_success;
  RocketListLinks? links;
  String? details;

  RocketList(
  {
    required this.flight_number,
    required this.mission_name,
    required this.launch_year,
    required this.launch_date_utc,
    required this.launch_success,
    required this.links,
    required this.details
});

  factory RocketList.fromJson(Map<String,dynamic> json) => RocketList(
      flight_number: json['flight_number'],
      mission_name: json['mission_name'],
      launch_year: json['launch_year'],
      launch_date_utc: json['launch_date_utc'],
      launch_success: json['launch_success'],
      links: RocketListLinks.fromJson(json['links']),
      details: json['details']
  );
}