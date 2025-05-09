// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Certification _$CertificationFromJson(Map<String, dynamic> json) =>
    Certification(
      name: json['name'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CertificationToJson(Certification instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
    };
