import 'package:json_annotation/json_annotation.dart';
part 'genre.g.dart';

@JsonSerializable()
class Genre {
  final String name;
  final String slug;

  Genre({required this.name, required this.slug});

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}
