import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/note_item.dart';
import 'package:traktx/src/models/show.dart';
part 'show_note_item.g.dart';

@JsonSerializable(explicitToJson: true)
class ShowNoteItem implements NoteItem {
  final String type;
  final Show show;

  ShowNoteItem({required this.type, required this.show});

  factory ShowNoteItem.fromJson(Map<String, dynamic> json) =>
      _$ShowNoteItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ShowNoteItemToJson(this);
}
