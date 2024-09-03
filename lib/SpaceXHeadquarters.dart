
class SpaceXHeadquarters
{
  String? address;
  String? city;
  String? state;

  SpaceXHeadquarters(
  {
    required this.address,
    required this.city,
    required this.state
  });

  factory SpaceXHeadquarters.fromJson(Map<String, dynamic> json) {
    return SpaceXHeadquarters(
        address: json['address'],
        city: json['city'],
        state: json['state']
    );
  }
}