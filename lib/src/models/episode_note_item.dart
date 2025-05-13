import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/episode.dart';
import 'package:traktx/src/models/note_item.dart';
part 'episode_note_item.g.dart';

@JsonSerializable(explicitToJson: true)
class EpisodeNoteItem implements NoteItem {
  final String type;
  final Episode episode;

  EpisodeNoteItem({required this.type, required this.episode});

  factory EpisodeNoteItem.fromJson(Map<String, dynamic> json) =>
      _$EpisodeNoteItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EpisodeNoteItemToJson(this);
}
