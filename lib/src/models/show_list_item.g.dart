// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowListItem _$ShowListItemFromJson(Map<String, dynamic> json) => ShowListItem(
  rank: (json['rank'] as num).toInt(),
  id: (json['id'] as num).toInt(),
  listedAt: DateTime.parse(json['listed_at'] as String),
  type: json['type'] as String,
  show: Show.fromJson(json['show'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ShowListItemToJson(ShowListItem instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'id': instance.id,
      'listed_at': instance.listedAt.toIso8601String(),
      'type': instance.type,
      'show': instance.show.toJson(),
    };
