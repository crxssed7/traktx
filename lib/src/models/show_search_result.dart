import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/search_result.dart';
import 'package:traktx/src/models/show.dart';
part 'show_search_result.g.dart';

@JsonSerializable(explicitToJson: true)
class ShowSearchResult implements SearchResult {
  final String type;
  final double score;
  final Show show;

  ShowSearchResult({
    required this.type,
    required this.score,
    required this.show,
  });

  factory ShowSearchResult.fromJson(Map<String, dynamic> json) =>
      _$ShowSearchResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ShowSearchResultToJson(this);
}
