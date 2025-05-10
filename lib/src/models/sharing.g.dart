// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sharing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sharing _$SharingFromJson(Map<String, dynamic> json) => Sharing(
  twitter: json['twitter'] as bool? ?? false,
  mastodon: json['mastodon'] as bool? ?? false,
  tumblr: json['tumblr'] as bool? ?? false,
);

Map<String, dynamic> _$SharingToJson(Sharing instance) => <String, dynamic>{
  'twitter': instance.twitter,
  'mastodon': instance.mastodon,
  'tumblr': instance.tumblr,
};
