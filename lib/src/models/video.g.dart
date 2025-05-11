// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Video _$VideoFromJson(Map<String, dynamic> json) => Video(
  title: json['title'] as String,
  url: json['url'] as String,
  site: json['site'] as String,
  type: json['type'] as String,
  size: (json['size'] as num).toInt(),
  official: json['official'] as bool,
  publishedAt: DateTime.parse(json['published_at'] as String),
  country: json['country'] as String?,
  language: json['language'] as String?,
);

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
  'title': instance.title,
  'url': instance.url,
  'site': instance.site,
  'type': instance.type,
  'size': instance.size,
  'official': instance.official,
  'published_at': instance.publishedAt.toIso8601String(),
  'country': instance.country,
  'language': instance.language,
};
