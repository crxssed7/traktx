// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_note_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonNoteItem _$PersonNoteItemFromJson(Map<String, dynamic> json) =>
    PersonNoteItem(
      type: json['type'] as String,
      person: Person.fromJson(json['person'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonNoteItemToJson(PersonNoteItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'person': instance.person.toJson(),
    };
