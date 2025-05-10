import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/trakt_ids.dart';
part 'movie.g.dart';

@JsonSerializable(explicitToJson: true)
class Movie {
  final String title;
  final int? year;
  final TraktIds ids;

  Movie({required this.title, this.year, required this.ids});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
