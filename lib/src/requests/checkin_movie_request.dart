import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/movie.dart';
import 'package:traktx/src/models/sharing.dart';
import 'package:traktx/src/requests/checkin_request.dart';
part 'checkin_movie_request.g.dart';

@JsonSerializable(explicitToJson: true)
class CheckinMovieRequest implements CheckinRequest {
  final Movie movie;
  final Sharing? sharing;
  final String? message;

  CheckinMovieRequest({required this.movie, this.sharing, this.message});

  factory CheckinMovieRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckinMovieRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CheckinMovieRequestToJson(this);
}
