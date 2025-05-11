// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ratings _$RatingsFromJson(Map<String, dynamic> json) => Ratings(
  rating: (json['rating'] as num).toDouble(),
  votes: (json['votes'] as num).toInt(),
  distribution: Map<String, int>.from(json['distribution'] as Map),
);

Map<String, dynamic> _$RatingsToJson(Ratings instance) => <String, dynamic>{
  'rating': instance.rating,
  'votes': instance.votes,
  'distribution': instance.distribution,
};
