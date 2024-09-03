
import 'package:space_x_app/SpaceXHeadquarters.dart';
import 'package:space_x_app/SpaceXLinks.dart';

class SpaceXInformation
{
  String? name;
  String? founder;
  int? founded;
  int? employees;
  int? vehicles;
  int? launch_sites;
  int? test_sites;
  String? ceo;
  String? cto;
  String? coo;
  String? cto_propulsion;
  int? valuation;
  SpaceXHeadquarters? headquarters;
  SpaceXLinks? links;
  String? summary;

  SpaceXInformation({
    required this.name,
    required this.founder,
    required this.founded,
    required this.employees,
    required this.vehicles,
    required this.launch_sites,
    required this.test_sites,
    required this.ceo,
    required this.cto,
    required this.coo,
    required this.cto_propulsion,
    required this.valuation,
    required this.headquarters,
    required this.links,
    required this.summary
});

  factory SpaceXInformation.fromJson(Map<String, dynamic> json) {
    return SpaceXInformation(
        name: json['name'],
        founder: json['founder'],
        founded: json['founded'],
        employees: json['employees'],
        vehicles: json['vehicles'],
        launch_sites: json['launch_sites'],
        test_sites: json['test_sites'],
        ceo: json['ceo'],
        cto: json['cto'],
        coo: json['coo'],
        cto_propulsion: json['cto_propulsion'],
        valuation: json['valuation'],
        headquarters: SpaceXHeadquarters.fromJson(json['headquarters']),
        links: SpaceXLinks.fromJson(json['links']),
        summary: json['summary']
    );
  }
}