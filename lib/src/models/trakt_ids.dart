import 'package:json_annotation/json_annotation.dart';
part 'trakt_ids.g.dart';

@JsonSerializable(includeIfNull: false)
class TraktIds {
  final int? trakt;
  final int? tmdb;
  final String? slug;
  final int? tvdb;
  final String? imdb;

  TraktIds({this.trakt, this.tmdb, this.slug, this.imdb, this.tvdb});

  factory TraktIds.fromJson(Map<String, dynamic> json) =>
      _$TraktIdsFromJson(json);
  Map<String, dynamic> toJson() => _$TraktIdsToJson(this);
}
