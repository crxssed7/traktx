import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/note_item.dart';
part 'unknown_note_item.g.dart';

@JsonSerializable(explicitToJson: true)
class UnknownNoteItem implements NoteItem {
  final String type;

  UnknownNoteItem({required this.type});

  factory UnknownNoteItem.fromJson(Map<String, dynamic> json) =>
      _$UnknownNoteItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UnknownNoteItemToJson(this);
}
