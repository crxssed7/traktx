import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/favourited_by.dart';
import 'package:traktx/src/models/trakt_ids.dart';
part 'movie_recommendation.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieRecommendation {
  final String title;
  final int? year;
  final TraktIds ids;
  @JsonKey(name: 'favorited_by')
  final List<FavouritedBy> favoritedBy;

  MovieRecommendation({
    required this.title,
    this.year,
    required this.ids,
    required this.favoritedBy,
  });

  factory MovieRecommendation.fromJson(Map<String, dynamic> json) =>
      _$MovieRecommendationFromJson(json);
  Map<String, dynamic> toJson() => _$MovieRecommendationToJson(this);
}
