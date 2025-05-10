import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/trakt_ids.dart';
part 'episode.g.dart';

@JsonSerializable(explicitToJson: true)
class Episode {
  final String? title;
  final int season;
  final int number;
  final TraktIds ids;

  Episode({
    this.title,
    required this.season,
    required this.number,
    required this.ids,
  });

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}
