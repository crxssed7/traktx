import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/trakt_ids.dart';
part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  final String username;
  final bool private;
  final String? name;
  @JsonKey(defaultValue: false)
  final bool vip;
  @JsonKey(name: 'vip_ep', defaultValue: false)
  final bool vipEp;
  final TraktIds ids;

  User({
    required this.username,
    required this.private,
    this.name,
    required this.vip,
    required this.vipEp,
    required this.ids,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
