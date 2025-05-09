// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceCode _$DeviceCodeFromJson(Map<String, dynamic> json) => DeviceCode(
  deviceCode: json['device_code'] as String,
  userCode: json['user_code'] as String,
  verificationUrl: json['verification_url'] as String,
  expiresIn: (json['expires_in'] as num).toInt(),
  interval: (json['interval'] as num).toInt(),
);

Map<String, dynamic> _$DeviceCodeToJson(DeviceCode instance) =>
    <String, dynamic>{
      'device_code': instance.deviceCode,
      'user_code': instance.userCode,
      'verification_url': instance.verificationUrl,
      'expires_in': instance.expiresIn,
      'interval': instance.interval,
    };
