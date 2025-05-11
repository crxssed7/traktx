import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/list_item.dart';
import 'package:traktx/src/models/show.dart';
part 'show_list_item.g.dart';

@JsonSerializable(explicitToJson: true)
class ShowListItem implements ListItem {
  final int rank;
  final int id;
  @JsonKey(name: 'listed_at')
  final DateTime listedAt;
  final String type;
  final Show show;

  ShowListItem({
    required this.rank,
    required this.id,
    required this.listedAt,
    required this.type,
    required this.show,
  });

  factory ShowListItem.fromJson(Map<String, dynamic> json) =>
      _$ShowListItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ShowListItemToJson(this);
}
