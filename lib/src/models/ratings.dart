import 'package:json_annotation/json_annotation.dart';
part 'ratings.g.dart';

@JsonSerializable()
class Ratings {
  final double rating;
  final int votes;
  final Map<String, int> distribution;

  Ratings({
    required this.rating,
    required this.votes,
    required this.distribution,
  });

  factory Ratings.fromJson(Map<String, dynamic> json) =>
      _$RatingsFromJson(json);
  Map<String, dynamic> toJson() => _$RatingsToJson(this);
}
