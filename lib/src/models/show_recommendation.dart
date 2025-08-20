import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/favourited_by.dart';
import 'package:traktx/src/models/trakt_ids.dart';
part 'show_recommendation.g.dart';

@JsonSerializable(explicitToJson: true)
class ShowRecommendation {
  final String title;
  final int year;
  final TraktIds ids;
  @JsonKey(name: 'favorited_by')
  final List<FavouritedBy> favoritedBy;

  ShowRecommendation({
    required this.title,
    required this.year,
    required this.ids,
    required this.favoritedBy,
  });

  factory ShowRecommendation.fromJson(Map<String, dynamic> json) =>
      _$ShowRecommendationFromJson(json);
  Map<String, dynamic> toJson() => _$ShowRecommendationToJson(this);
}
