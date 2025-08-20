import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/movie.dart';
import 'package:traktx/src/models/search_result.dart';
part 'movie_search_result.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieSearchResult implements SearchResult {
  final String type;
  final double score;
  final Movie movie;

  MovieSearchResult({
    required this.type,
    required this.score,
    required this.movie,
  });

  factory MovieSearchResult.fromJson(Map<String, dynamic> json) =>
      _$MovieSearchResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MovieSearchResultToJson(this);
}
