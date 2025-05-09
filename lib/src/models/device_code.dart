import 'package:json_annotation/json_annotation.dart';
part 'device_code.g.dart';

@JsonSerializable()
class DeviceCode {
  @JsonKey(name: 'device_code')
  final String deviceCode;
  @JsonKey(name: 'user_code')
  final String userCode;
  @JsonKey(name: 'verification_url')
  final String verificationUrl;
  @JsonKey(name: 'expires_in')
  final int expiresIn;
  final int interval;

  DeviceCode({
    required this.deviceCode,
    required this.userCode,
    required this.verificationUrl,
    required this.expiresIn,
    required this.interval,
  });

  factory DeviceCode.fromJson(Map<String, dynamic> json) =>
      _$DeviceCodeFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceCodeToJson(this);
}
