// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trakt_ids.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TraktIds _$TraktIdsFromJson(Map<String, dynamic> json) => TraktIds(
  trakt: (json['trakt'] as num?)?.toInt(),
  tmdb: (json['tmdb'] as num?)?.toInt(),
  slug: json['slug'] as String?,
  imdb: json['imdb'] as String?,
  tvdb: (json['tvdb'] as num?)?.toInt(),
);

Map<String, dynamic> _$TraktIdsToJson(TraktIds instance) => <String, dynamic>{
  if (instance.trakt case final value?) 'trakt': value,
  if (instance.tmdb case final value?) 'tmdb': value,
  if (instance.slug case final value?) 'slug': value,
  if (instance.tvdb case final value?) 'tvdb': value,
  if (instance.imdb case final value?) 'imdb': value,
};
