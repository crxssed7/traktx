// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin_episode_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckinEpisodeRequest _$CheckinEpisodeRequestFromJson(
  Map<String, dynamic> json,
) => CheckinEpisodeRequest(
  episode: Episode.fromJson(json['episode'] as Map<String, dynamic>),
  sharing:
      json['sharing'] == null
          ? null
          : Sharing.fromJson(json['sharing'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$CheckinEpisodeRequestToJson(
  CheckinEpisodeRequest instance,
) => <String, dynamic>{
  'episode': instance.episode.toJson(),
  'sharing': instance.sharing?.toJson(),
  'message': instance.message,
};
