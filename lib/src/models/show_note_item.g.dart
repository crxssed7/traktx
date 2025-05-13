// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_note_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowNoteItem _$ShowNoteItemFromJson(Map<String, dynamic> json) => ShowNoteItem(
  type: json['type'] as String,
  show: Show.fromJson(json['show'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ShowNoteItemToJson(ShowNoteItem instance) =>
    <String, dynamic>{'type': instance.type, 'show': instance.show.toJson()};
