import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/list.dart';
import 'package:traktx/src/models/sharing.dart';
import 'package:traktx/src/requests/comment_create_request.dart';
part 'comment_list_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class CommentListRequest implements CommentCreateRequest {
  final List list;
  final String comment;
  final bool? spoiler;
  final Sharing? sharing;

  CommentListRequest({
    required this.list,
    required this.comment,
    this.spoiler,
    this.sharing,
  });

  factory CommentListRequest.fromJson(Map<String, dynamic> json) =>
      _$CommentListRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CommentListRequestToJson(this);
}
