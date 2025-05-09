import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/trakt_ids.dart';
part 'network.g.dart';

@JsonSerializable(explicitToJson: true)
class Network {
  final String name;
  final String? country;
  final TraktIds ids;

  Network({required this.name, required this.ids, this.country});

  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkToJson(this);
}
