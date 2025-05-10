import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/episode.dart';
import 'package:traktx/src/models/show.dart';
part 'calendar_show.g.dart';

@JsonSerializable(explicitToJson: true)
class CalendarShow {
  @JsonKey(name: 'first_aired')
  final DateTime firstAired;
  final Episode episode;
  final Show show;

  CalendarShow({
    required this.firstAired,
    required this.episode,
    required this.show,
  });

  factory CalendarShow.fromJson(Map<String, dynamic> json) =>
      _$CalendarShowFromJson(json);
  Map<String, dynamic> toJson() => _$CalendarShowToJson(this);
}
