import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/season.dart';
import 'package:traktx/src/requests/note_create_request.dart';
part 'note_season_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class NoteSeasonRequest implements NoteCreateRequest {
  final Season season;
  final String note;
  final bool? spoiler;
  final String? privacy;

  NoteSeasonRequest({
    required this.season,
    required this.note,
    this.spoiler,
    this.privacy,
  });

  factory NoteSeasonRequest.fromJson(Map<String, dynamic> json) =>
      _$NoteSeasonRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NoteSeasonRequestToJson(this);
}
