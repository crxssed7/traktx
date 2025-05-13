import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/show.dart';
import 'package:traktx/src/requests/note_create_request.dart';
part 'note_show_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class NoteShowRequest implements NoteCreateRequest {
  final Show show;
  final String note;
  final bool? spoiler;
  final String? privacy;

  NoteShowRequest({
    required this.show,
    required this.note,
    this.spoiler,
    this.privacy,
  });

  factory NoteShowRequest.fromJson(Map<String, dynamic> json) =>
      _$NoteShowRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NoteShowRequestToJson(this);
}
