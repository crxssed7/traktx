import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/user.dart';
part 'favourited_by.g.dart';

@JsonSerializable(explicitToJson: true)
class FavouritedBy {
  final User user;
  final String? notes;

  FavouritedBy({required this.user, this.notes});

  factory FavouritedBy.fromJson(Map<String, dynamic> json) =>
      _$FavouritedByFromJson(json);
  Map<String, dynamic> toJson() => _$FavouritedByToJson(this);
}
