// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_episode_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteEpisodeRequest _$NoteEpisodeRequestFromJson(Map<String, dynamic> json) =>
    NoteEpisodeRequest(
      episode: Episode.fromJson(json['episode'] as Map<String, dynamic>),
      note: json['note'] as String,
      spoiler: json['spoiler'] as bool?,
      privacy: json['privacy'] as String?,
    );

Map<String, dynamic> _$NoteEpisodeRequestToJson(NoteEpisodeRequest instance) =>
    <String, dynamic>{
      'episode': instance.episode.toJson(),
      'note': instance.note,
      if (instance.spoiler case final value?) 'spoiler': value,
      if (instance.privacy case final value?) 'privacy': value,
    };
