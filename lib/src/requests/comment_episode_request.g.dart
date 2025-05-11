// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_episode_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentEpisodeRequest _$CommentEpisodeRequestFromJson(
  Map<String, dynamic> json,
) => CommentEpisodeRequest(
  episode: Episode.fromJson(json['episode'] as Map<String, dynamic>),
  comment: json['comment'] as String,
  spoiler: json['spoiler'] as bool?,
  sharing:
      json['sharing'] == null
          ? null
          : Sharing.fromJson(json['sharing'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CommentEpisodeRequestToJson(
  CommentEpisodeRequest instance,
) => <String, dynamic>{
  'episode': instance.episode.toJson(),
  'comment': instance.comment,
  if (instance.spoiler case final value?) 'spoiler': value,
  if (instance.sharing?.toJson() case final value?) 'sharing': value,
};
