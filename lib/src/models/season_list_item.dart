import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/list_item.dart';
import 'package:traktx/src/models/season.dart';
import 'package:traktx/src/models/show.dart';
part 'season_list_item.g.dart';

@JsonSerializable(explicitToJson: true)
class SeasonListItem implements ListItem {
  final int rank;
  final int id;
  @JsonKey(name: 'listed_at')
  final DateTime listedAt;
  final String type;
  final Season season;
  final Show show;

  SeasonListItem({
    required this.rank,
    required this.id,
    required this.listedAt,
    required this.type,
    required this.season,
    required this.show,
  });

  factory SeasonListItem.fromJson(Map<String, dynamic> json) =>
      _$SeasonListItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SeasonListItemToJson(this);
}
