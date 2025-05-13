import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/note_item.dart';
import 'package:traktx/src/models/season.dart';
part 'season_note_item.g.dart';

@JsonSerializable(explicitToJson: true)
class SeasonNoteItem implements NoteItem {
  final String type;
  final Season season;

  SeasonNoteItem({required this.type, required this.season});

  factory SeasonNoteItem.fromJson(Map<String, dynamic> json) =>
      _$SeasonNoteItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SeasonNoteItemToJson(this);
}
