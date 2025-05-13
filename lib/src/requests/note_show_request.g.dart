// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_show_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteShowRequest _$NoteShowRequestFromJson(Map<String, dynamic> json) =>
    NoteShowRequest(
      show: Show.fromJson(json['show'] as Map<String, dynamic>),
      note: json['note'] as String,
      spoiler: json['spoiler'] as bool?,
      privacy: json['privacy'] as String?,
    );

Map<String, dynamic> _$NoteShowRequestToJson(NoteShowRequest instance) =>
    <String, dynamic>{
      'show': instance.show.toJson(),
      'note': instance.note,
      if (instance.spoiler case final value?) 'spoiler': value,
      if (instance.privacy case final value?) 'privacy': value,
    };
