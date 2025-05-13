import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/note_item.dart';
import 'package:traktx/src/models/person.dart';
part 'person_note_item.g.dart';

@JsonSerializable(explicitToJson: true)
class PersonNoteItem implements NoteItem {
  final String type;
  final Person person;

  PersonNoteItem({required this.type, required this.person});

  factory PersonNoteItem.fromJson(Map<String, dynamic> json) =>
      _$PersonNoteItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PersonNoteItemToJson(this);
}
