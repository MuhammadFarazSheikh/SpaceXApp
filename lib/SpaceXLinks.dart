
class SpaceXLinks{
  String? website;
  String? flickr;
  String? twitter;
  String? elon_twitter;

  SpaceXLinks(
  {
    required this.website,
    required this.flickr,
    required this.twitter,
    required this.elon_twitter
  });

  factory SpaceXLinks.fromJson(Map<String,dynamic> json) => SpaceXLinks(
    website: json['website'],
    flickr: json['flickr'],
    twitter: json['twitter'],
    elon_twitter: json['elon_twitter'],
  );
}