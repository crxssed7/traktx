// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeListItem _$EpisodeListItemFromJson(Map<String, dynamic> json) =>
    EpisodeListItem(
      rank: (json['rank'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      listedAt: DateTime.parse(json['listed_at'] as String),
      type: json['type'] as String,
      episode: Episode.fromJson(json['episode'] as Map<String, dynamic>),
      show: Show.fromJson(json['show'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EpisodeListItemToJson(EpisodeListItem instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'id': instance.id,
      'listed_at': instance.listedAt.toIso8601String(),
      'type': instance.type,
      'episode': instance.episode.toJson(),
      'show': instance.show.toJson(),
    };
