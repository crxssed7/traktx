// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_season_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentSeasonRequest _$CommentSeasonRequestFromJson(
  Map<String, dynamic> json,
) => CommentSeasonRequest(
  season: Season.fromJson(json['season'] as Map<String, dynamic>),
  comment: json['comment'] as String,
  spoiler: json['spoiler'] as bool?,
  sharing:
      json['sharing'] == null
          ? null
          : Sharing.fromJson(json['sharing'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CommentSeasonRequestToJson(
  CommentSeasonRequest instance,
) => <String, dynamic>{
  'season': instance.season.toJson(),
  'comment': instance.comment,
  if (instance.spoiler case final value?) 'spoiler': value,
  if (instance.sharing?.toJson() case final value?) 'sharing': value,
};
