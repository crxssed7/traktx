// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Network _$NetworkFromJson(Map<String, dynamic> json) => Network(
  name: json['name'] as String,
  ids: TraktIds.fromJson(json['ids'] as Map<String, dynamic>),
  country: json['country'] as String?,
);

Map<String, dynamic> _$NetworkToJson(Network instance) => <String, dynamic>{
  'name': instance.name,
  'country': instance.country,
  'ids': instance.ids.toJson(),
};
