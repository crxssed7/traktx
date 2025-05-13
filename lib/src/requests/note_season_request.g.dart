// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_season_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteSeasonRequest _$NoteSeasonRequestFromJson(Map<String, dynamic> json) =>
    NoteSeasonRequest(
      season: Season.fromJson(json['season'] as Map<String, dynamic>),
      note: json['note'] as String,
      spoiler: json['spoiler'] as bool?,
      privacy: json['privacy'] as String?,
    );

Map<String, dynamic> _$NoteSeasonRequestToJson(NoteSeasonRequest instance) =>
    <String, dynamic>{
      'season': instance.season.toJson(),
      'note': instance.note,
      if (instance.spoiler case final value?) 'spoiler': value,
      if (instance.privacy case final value?) 'privacy': value,
    };
