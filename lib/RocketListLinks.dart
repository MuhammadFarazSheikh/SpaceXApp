
class RocketListLinks{
  String? mission_patch;
  String? mission_patch_small;
  String? article_link;
  String? wikipedia;
  String? video_link;

  RocketListLinks(
  {
    required this.mission_patch,
    required this.mission_patch_small,
    required this.article_link,
    required this.wikipedia,
    required this.video_link
  });

  factory RocketListLinks.fromJson(Map<String,dynamic> json) => RocketListLinks(
      mission_patch: json['mission_patch'],
      mission_patch_small: json['mission_patch_small'],
      article_link: json['article_link'],
      wikipedia: json['wikipedia'],
      video_link: json['video_link']
  );

}