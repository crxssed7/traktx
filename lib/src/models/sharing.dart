import 'package:json_annotation/json_annotation.dart';
part 'sharing.g.dart';

@JsonSerializable()
class Sharing {
  final bool twitter;
  final bool mastodon;
  final bool tumblr;

  Sharing({this.twitter = false, this.mastodon = false, this.tumblr = false});

  factory Sharing.fromJson(Map<String, dynamic> json) =>
      _$SharingFromJson(json);
  Map<String, dynamic> toJson() => _$SharingToJson(this);
}
