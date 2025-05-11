import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:traktx/src/models/user.dart';
part 'list.g.dart';

@JsonSerializable(explicitToJson: true)
class List {
  final String name;
  final String description;
  final String privacy;
  @JsonKey(name: 'share_link')
  final String shareLink;
  final String type;
  @JsonKey(name: 'display_numbers')
  final bool displayNumbers;
  @JsonKey(name: 'allow_comments')
  final bool allowComments;
  @JsonKey(name: 'sort_by')
  final String sortBy;
  @JsonKey(name: 'sort_how')
  final String sortHow;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @JsonKey(name: 'item_count')
  final int itemCount;
  @JsonKey(name: 'comment_count')
  final int commentCount;
  final int likes;
  final TraktIds ids;
  final User user;

  List({
    required this.name,
    required this.description,
    required this.privacy,
    required this.shareLink,
    required this.type,
    required this.displayNumbers,
    required this.allowComments,
    required this.sortBy,
    required this.sortHow,
    required this.createdAt,
    required this.updatedAt,
    required this.itemCount,
    required this.commentCount,
    required this.likes,
    required this.ids,
    required this.user,
  });

  factory List.fromJson(Map<String, dynamic> json) => _$ListFromJson(json);

  Map<String, dynamic> toJson() => _$ListToJson(this);
}
