import 'package:json_annotation/json_annotation.dart';
part 'translation.g.dart';

@JsonSerializable()
class Translation {
  final String? title;
  final String? overview;
  final String? tagline;
  final String language;
  final String country;

  Translation({
    this.title,
    this.overview,
    this.tagline,
    required this.language,
    required this.country,
  });

  factory Translation.fromJson(Map<String, dynamic> json) =>
      _$TranslationFromJson(json);
  Map<String, dynamic> toJson() => _$TranslationToJson(this);
}
