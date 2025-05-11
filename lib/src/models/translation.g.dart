// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Translation _$TranslationFromJson(Map<String, dynamic> json) => Translation(
  title: json['title'] as String?,
  overview: json['overview'] as String?,
  tagline: json['tagline'] as String?,
  language: json['language'] as String,
  country: json['country'] as String,
);

Map<String, dynamic> _$TranslationToJson(Translation instance) =>
    <String, dynamic>{
      'title': instance.title,
      'overview': instance.overview,
      'tagline': instance.tagline,
      'language': instance.language,
      'country': instance.country,
    };
