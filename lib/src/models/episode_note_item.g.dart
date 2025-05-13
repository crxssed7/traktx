// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_note_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeNoteItem _$EpisodeNoteItemFromJson(Map<String, dynamic> json) =>
    EpisodeNoteItem(
      type: json['type'] as String,
      episode: Episode.fromJson(json['episode'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EpisodeNoteItemToJson(EpisodeNoteItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'episode': instance.episode.toJson(),
    };
