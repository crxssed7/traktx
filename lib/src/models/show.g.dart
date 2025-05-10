// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Show _$ShowFromJson(Map<String, dynamic> json) => Show(
  title: json['title'] as String,
  year: (json['year'] as num).toInt(),
  ids: TraktIds.fromJson(json['ids'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ShowToJson(Show instance) => <String, dynamic>{
  'title': instance.title,
  'year': instance.year,
  'ids': instance.ids.toJson(),
};
