// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unknown_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnknownListItem _$UnknownListItemFromJson(Map<String, dynamic> json) =>
    UnknownListItem(
      rank: (json['rank'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      listedAt: DateTime.parse(json['listed_at'] as String),
      type: json['type'] as String,
    );

Map<String, dynamic> _$UnknownListItemToJson(UnknownListItem instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'id': instance.id,
      'listed_at': instance.listedAt.toIso8601String(),
      'type': instance.type,
    };
