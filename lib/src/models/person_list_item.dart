import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/list_item.dart';
import 'package:traktx/src/models/person.dart';
part 'person_list_item.g.dart';

@JsonSerializable(explicitToJson: true)
class PersonListItem implements ListItem {
  final int rank;
  final int id;
  @JsonKey(name: 'listed_at')
  final DateTime listedAt;
  final String type;
  final Person person;

  PersonListItem({
    required this.rank,
    required this.id,
    required this.listedAt,
    required this.type,
    required this.person,
  });

  factory PersonListItem.fromJson(Map<String, dynamic> json) =>
      _$PersonListItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PersonListItemToJson(this);
}
