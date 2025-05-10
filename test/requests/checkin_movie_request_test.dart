import 'package:test/test.dart';
import 'package:traktx/src/requests/checkin_movie_request.dart';
import 'package:traktx/src/models/movie.dart';
import 'package:traktx/src/models/sharing.dart';
import 'package:traktx/src/models/trakt_ids.dart';

void main() {
  group('CheckinMovieRequest', () {
    group('fromJson', () {
      test('it parses with all fields present', () {
        final json = {
          'movie': {
            'title': 'Inception',
            'year': 2010,
            'ids': {'trakt': 1},
          },
          'sharing': {'twitter': true, 'mastodon': false, 'tumblr': false},
          'message': 'Amazing movie!',
        };

        final request = CheckinMovieRequest.fromJson(json);
        expect(request.movie.title, 'Inception');
        expect(request.movie.year, 2010);
        expect(request.movie.ids.trakt, 1);
        expect(request.sharing?.twitter, true);
        expect(request.sharing?.mastodon, false);
        expect(request.sharing?.tumblr, false);
        expect(request.message, 'Amazing movie!');
      });

      test('it parses with null sharing and null message', () {
        final json = {
          'movie': {
            'title': 'Dune',
            'year': 2021,
            'ids': {'trakt': 2},
          },
          'sharing': null,
          'message': null,
        };

        final request = CheckinMovieRequest.fromJson(json);
        expect(request.movie.title, 'Dune');
        expect(request.sharing, isNull);
        expect(request.message, isNull);
      });
    });

    group('toJson', () {
      test('it serializes with all fields', () {
        final request = CheckinMovieRequest(
          movie: Movie(title: 'Inception', year: 2010, ids: TraktIds(trakt: 1)),
          sharing: Sharing(twitter: true),
          message: 'Amazing movie!',
        );

        final expectedJson = {
          'movie': {
            'title': 'Inception',
            'year': 2010,
            'ids': {'trakt': 1},
          },
          'sharing': {'twitter': true, 'mastodon': false, 'tumblr': false},
          'message': 'Amazing movie!',
        };

        expect(request.toJson(), expectedJson);
      });

      test('it serializes with null sharing and null message', () {
        final request = CheckinMovieRequest(
          movie: Movie(title: 'Dune', year: 2021, ids: TraktIds(trakt: 2)),
          sharing: null,
          message: null,
        );

        final expectedJson = {
          'movie': {
            'title': 'Dune',
            'year': 2021,
            'ids': {'trakt': 2},
          },
          'sharing': null,
          'message': null,
        };

        expect(request.toJson(), expectedJson);
      });
    });
  });
}
