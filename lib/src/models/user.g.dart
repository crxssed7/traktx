// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  username: json['username'] as String,
  private: json['private'] as bool,
  name: json['name'] as String?,
  vip: json['vip'] as bool? ?? false,
  vipEp: json['vip_ep'] as bool? ?? false,
  ids: TraktIds.fromJson(json['ids'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'username': instance.username,
  'private': instance.private,
  'name': instance.name,
  'vip': instance.vip,
  'vip_ep': instance.vipEp,
  'ids': instance.ids.toJson(),
};
