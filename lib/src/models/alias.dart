import 'package:json_annotation/json_annotation.dart';
part 'alias.g.dart';

@JsonSerializable()
class Alias {
  final String title;
  final String country;

  Alias({required this.title, required this.country});

  factory Alias.fromJson(Map<String, dynamic> json) => _$AliasFromJson(json);
  Map<String, dynamic> toJson() => _$AliasToJson(this);
}
