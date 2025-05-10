// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserStats _$UserStatsFromJson(Map<String, dynamic> json) => UserStats(
  rating: (json['rating'] as num?)?.toInt(),
  playCount: (json['play_count'] as num).toInt(),
  completedCount: (json['completed_count'] as num).toInt(),
);

Map<String, dynamic> _$UserStatsToJson(UserStats instance) => <String, dynamic>{
  'rating': instance.rating,
  'play_count': instance.playCount,
  'completed_count': instance.completedCount,
};
