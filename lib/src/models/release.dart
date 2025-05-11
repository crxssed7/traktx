import 'package:json_annotation/json_annotation.dart';
part 'release.g.dart';

@JsonSerializable()
class Release {
  final String country;
  final String? certification;
  @JsonKey(name: 'release_date')
  final DateTime releaseDate;
  @JsonKey(name: 'release_type')
  final String releaseType;

  Release({
    required this.country,
    this.certification,
    required this.releaseDate,
    required this.releaseType,
  });

  factory Release.fromJson(Map<String, dynamic> json) =>
      _$ReleaseFromJson(json);
  Map<String, dynamic> toJson() => _$ReleaseToJson(this);
}
