import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/trakt_ids.dart';
part 'season.g.dart';

@JsonSerializable(explicitToJson: true)
class Season {
  final int number;
  final TraktIds ids;

  Season({required this.number, required this.ids});

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);
  Map<String, dynamic> toJson() => _$SeasonToJson(this);
}
