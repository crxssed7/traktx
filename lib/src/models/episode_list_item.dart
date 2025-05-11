import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/episode.dart';
import 'package:traktx/src/models/list_item.dart';
import 'package:traktx/src/models/show.dart';
part 'episode_list_item.g.dart';

@JsonSerializable(explicitToJson: true)
class EpisodeListItem implements ListItem {
  final int rank;
  final int id;
  @JsonKey(name: 'listed_at')
  final DateTime listedAt;
  final String type;
  final Episode episode;
  final Show show;

  EpisodeListItem({
    required this.rank,
    required this.id,
    required this.listedAt,
    required this.type,
    required this.episode,
    required this.show,
  });

  factory EpisodeListItem.fromJson(Map<String, dynamic> json) =>
      _$EpisodeListItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EpisodeListItemToJson(this);
}
