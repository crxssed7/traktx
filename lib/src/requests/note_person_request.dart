import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/person.dart';
import 'package:traktx/src/requests/note_create_request.dart';
part 'note_person_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class NotePersonRequest implements NoteCreateRequest {
  final Person person;
  final String note;
  final bool? spoiler;
  final String? privacy;

  NotePersonRequest({
    required this.person,
    required this.note,
    this.spoiler,
    this.privacy,
  });

  factory NotePersonRequest.fromJson(Map<String, dynamic> json) =>
      _$NotePersonRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NotePersonRequestToJson(this);
}
