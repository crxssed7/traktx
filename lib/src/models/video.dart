import 'package:json_annotation/json_annotation.dart';
part 'video.g.dart';

@JsonSerializable()
class Video {
  final String title;
  final String url;
  final String site;
  final String type;
  final int size;
  final bool official;
  @JsonKey(name: 'published_at')
  final DateTime publishedAt;
  final String? country;
  final String? language;

  Video({
    required this.title,
    required this.url,
    required this.site,
    required this.type,
    required this.size,
    required this.official,
    required this.publishedAt,
    this.country,
    this.language,
  });

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
  Map<String, dynamic> toJson() => _$VideoToJson(this);
}
