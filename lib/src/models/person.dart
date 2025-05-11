import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/trakt_ids.dart';
part 'person.g.dart';

@JsonSerializable(explicitToJson: true)
class Person {
  final String name;
  final TraktIds ids;

  Person({required this.name, required this.ids});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
