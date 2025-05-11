// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_comment_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeCommentItem _$EpisodeCommentItemFromJson(Map<String, dynamic> json) =>
    EpisodeCommentItem(
      type: json['type'] as String,
      episode: Episode.fromJson(json['episode'] as Map<String, dynamic>),
      comment:
          json['comment'] == null
              ? null
              : Comment.fromJson(json['comment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EpisodeCommentItemToJson(EpisodeCommentItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'episode': instance.episode.toJson(),
      if (instance.comment?.toJson() case final value?) 'comment': value,
    };
