import 'package:json_annotation/json_annotation.dart';
part 'language.g.dart';

@JsonSerializable()
class Language {
  final String name;
  final String code;

  Language({required this.name, required this.code});

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);
  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}
