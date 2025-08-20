import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/episode.dart';
import 'package:traktx/src/models/search_result.dart';
import 'package:traktx/src/models/show.dart';
part 'episode_search_result.g.dart';

@JsonSerializable(explicitToJson: true)
class EpisodeSearchResult implements SearchResult {
  final String type;
  final double score;
  final Episode episode;
  final Show show;

  EpisodeSearchResult({
    required this.type,
    required this.score,
    required this.episode,
    required this.show,
  });

  factory EpisodeSearchResult.fromJson(Map<String, dynamic> json) =>
      _$EpisodeSearchResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EpisodeSearchResultToJson(this);
}
