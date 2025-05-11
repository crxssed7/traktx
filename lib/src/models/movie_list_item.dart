import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/list_item.dart';
import 'package:traktx/src/models/movie.dart';
part 'movie_list_item.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieListItem implements ListItem {
  final int rank;
  final int id;
  @JsonKey(name: 'listed_at')
  final DateTime listedAt;
  final String type;
  final Movie movie;

  MovieListItem({
    required this.rank,
    required this.id,
    required this.listedAt,
    required this.type,
    required this.movie,
  });

  factory MovieListItem.fromJson(Map<String, dynamic> json) =>
      _$MovieListItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MovieListItemToJson(this);
}
