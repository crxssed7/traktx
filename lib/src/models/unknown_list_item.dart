import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/list_item.dart';
part 'unknown_list_item.g.dart';

@JsonSerializable(explicitToJson: true)
class UnknownListItem implements ListItem {
  final int rank;
  final int id;
  @JsonKey(name: 'listed_at')
  final DateTime listedAt;
  final String type;

  UnknownListItem({
    required this.rank,
    required this.id,
    required this.listedAt,
    required this.type,
  });

  factory UnknownListItem.fromJson(Map<String, dynamic> json) =>
      _$UnknownListItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UnknownListItemToJson(this);
}
