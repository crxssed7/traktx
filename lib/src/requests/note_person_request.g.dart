// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_person_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotePersonRequest _$NotePersonRequestFromJson(Map<String, dynamic> json) =>
    NotePersonRequest(
      person: Person.fromJson(json['person'] as Map<String, dynamic>),
      note: json['note'] as String,
      spoiler: json['spoiler'] as bool?,
      privacy: json['privacy'] as String?,
    );

Map<String, dynamic> _$NotePersonRequestToJson(NotePersonRequest instance) =>
    <String, dynamic>{
      'person': instance.person.toJson(),
      'note': instance.note,
      if (instance.spoiler case final value?) 'spoiler': value,
      if (instance.privacy case final value?) 'privacy': value,
    };
