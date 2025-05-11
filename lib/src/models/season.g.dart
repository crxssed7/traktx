// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Season _$SeasonFromJson(Map<String, dynamic> json) => Season(
  number: (json['number'] as num).toInt(),
  ids: TraktIds.fromJson(json['ids'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SeasonToJson(Season instance) => <String, dynamic>{
  'number': instance.number,
  'ids': instance.ids.toJson(),
};
