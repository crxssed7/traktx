// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Release _$ReleaseFromJson(Map<String, dynamic> json) => Release(
  country: json['country'] as String,
  certification: json['certification'] as String?,
  releaseDate: DateTime.parse(json['release_date'] as String),
  releaseType: json['release_type'] as String,
);

Map<String, dynamic> _$ReleaseToJson(Release instance) => <String, dynamic>{
  'country': instance.country,
  'certification': instance.certification,
  'release_date': instance.releaseDate.toIso8601String(),
  'release_type': instance.releaseType,
};
