import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/trakt_ids.dart';
part 'show.g.dart';

@JsonSerializable(explicitToJson: true)
class Show {
  final String title;
  final int year;
  final TraktIds ids;

  Show({required this.title, required this.year, required this.ids});

  factory Show.fromJson(Map<String, dynamic> json) => _$ShowFromJson(json);
  Map<String, dynamic> toJson() => _$ShowToJson(this);
}
