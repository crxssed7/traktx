// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
  title: json['title'] as String,
  year: (json['year'] as num?)?.toInt(),
  ids: TraktIds.fromJson(json['ids'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
  'title': instance.title,
  'year': instance.year,
  'ids': instance.ids.toJson(),
};
