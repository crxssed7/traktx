import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/person.dart';
import 'package:traktx/src/models/search_result.dart';
part 'person_search_result.g.dart';

@JsonSerializable(explicitToJson: true)
class PersonSearchResult implements SearchResult {
  final String type;
  final double score;
  final Person person;

  PersonSearchResult({
    required this.type,
    required this.score,
    required this.person,
  });

  factory PersonSearchResult.fromJson(Map<String, dynamic> json) =>
      _$PersonSearchResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PersonSearchResultToJson(this);
}
