import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/sharing.dart';
import 'package:traktx/src/models/show.dart';
import 'package:traktx/src/requests/comment_create_request.dart';
part 'comment_show_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class CommentShowRequest implements CommentCreateRequest {
  final Show show;
  final String comment;
  final bool? spoiler;
  final Sharing? sharing;

  CommentShowRequest({
    required this.show,
    required this.comment,
    this.spoiler,
    this.sharing,
  });

  factory CommentShowRequest.fromJson(Map<String, dynamic> json) =>
      _$CommentShowRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CommentShowRequestToJson(this);
}
