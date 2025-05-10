import 'package:json_annotation/json_annotation.dart';
part 'user_stats.g.dart';

@JsonSerializable()
class UserStats {
  final int? rating;
  @JsonKey(name: 'play_count')
  final int playCount;
  @JsonKey(name: 'completed_count')
  final int completedCount;

  UserStats({
    this.rating,
    required this.playCount,
    required this.completedCount,
  });

  factory UserStats.fromJson(Map<String, dynamic> json) =>
      _$UserStatsFromJson(json);
  Map<String, dynamic> toJson() => _$UserStatsToJson(this);
}
