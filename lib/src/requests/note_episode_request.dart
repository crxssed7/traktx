import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/episode.dart';
import 'package:traktx/src/requests/note_create_request.dart';
part 'note_episode_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class NoteEpisodeRequest implements NoteCreateRequest {
  final Episode episode;
  final String note;
  final bool? spoiler;
  final String? privacy;

  NoteEpisodeRequest({
    required this.episode,
    required this.note,
    this.spoiler,
    this.privacy,
  });

  factory NoteEpisodeRequest.fromJson(Map<String, dynamic> json) =>
      _$NoteEpisodeRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NoteEpisodeRequestToJson(this);
}
