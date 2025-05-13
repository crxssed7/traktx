import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/user.dart';
part 'note.g.dart';

@JsonSerializable(explicitToJson: true)
class Note {
  final int id;
  final String notes;
  final String privacy;
  final bool spoiler;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  final User user;

  Note({
    required this.id,
    required this.notes,
    required this.privacy,
    required this.spoiler,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
  Map<String, dynamic> toJson() => _$NoteToJson(this);
}
