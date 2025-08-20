import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/list.dart';
import 'package:traktx/src/models/search_result.dart';
part 'list_search_result.g.dart';

@JsonSerializable(explicitToJson: true)
class ListSearchResult implements SearchResult {
  final String type;
  final double score;
  final List list;

  ListSearchResult({
    required this.type,
    required this.score,
    required this.list,
  });

  factory ListSearchResult.fromJson(Map<String, dynamic> json) =>
      _$ListSearchResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ListSearchResultToJson(this);
}
