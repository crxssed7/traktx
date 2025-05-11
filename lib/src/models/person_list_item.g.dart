// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonListItem _$PersonListItemFromJson(Map<String, dynamic> json) =>
    PersonListItem(
      rank: (json['rank'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      listedAt: DateTime.parse(json['listed_at'] as String),
      type: json['type'] as String,
      person: Person.fromJson(json['person'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonListItemToJson(PersonListItem instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'id': instance.id,
      'listed_at': instance.listedAt.toIso8601String(),
      'type': instance.type,
      'person': instance.person.toJson(),
    };
