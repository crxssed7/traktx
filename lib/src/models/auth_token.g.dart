// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthToken _$AuthTokenFromJson(Map<String, dynamic> json) => AuthToken(
  accessToken: json['access_token'] as String,
  tokenType: json['token_type'] as String,
  expiresIn: (json['expires_in'] as num).toInt(),
  refreshToken: json['refresh_token'] as String,
  scope: json['scope'] as String,
  createdAt: (json['created_at'] as num).toInt(),
);

Map<String, dynamic> _$AuthTokenToJson(AuthToken instance) => <String, dynamic>{
  'access_token': instance.accessToken,
  'token_type': instance.tokenType,
  'expires_in': instance.expiresIn,
  'refresh_token': instance.refreshToken,
  'scope': instance.scope,
  'created_at': instance.createdAt,
};
