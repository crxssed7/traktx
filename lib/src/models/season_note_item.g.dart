// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_note_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeasonNoteItem _$SeasonNoteItemFromJson(Map<String, dynamic> json) =>
    SeasonNoteItem(
      type: json['type'] as String,
      season: Season.fromJson(json['season'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SeasonNoteItemToJson(SeasonNoteItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'season': instance.season.toJson(),
    };
