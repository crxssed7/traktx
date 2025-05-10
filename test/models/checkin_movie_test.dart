import 'package:test/test.dart';
import 'package:traktx/src/models/checkin_movie.dart';
import 'package:traktx/src/models/movie.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:traktx/src/models/sharing.dart';

void main() {
  group('CheckinMovie', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'id': 123,
          'watched_at': '2023-01-01T20:00:00.000Z',
          'sharing': {'twitter': true, 'mastodon': true, 'tumblr': false},
          'movie': {
            'title': 'Inception',
            'year': 2010,
            'ids': {'trakt': 1},
          },
        };

        final checkinMovie = CheckinMovie.fromJson(json);
        expect(checkinMovie.id, 123);
        expect(
          checkinMovie.watchedAt.toUtc().toIso8601String(),
          '2023-01-01T20:00:00.000Z',
        );
        expect(checkinMovie.sharing.twitter, true);
        expect(checkinMovie.sharing.mastodon, true);
        expect(checkinMovie.sharing.tumblr, false);
        expect(checkinMovie.movie.title, 'Inception');
        expect(checkinMovie.movie.year, 2010);
        expect(checkinMovie.movie.ids.trakt, 1);
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final checkinMovie = CheckinMovie(
          id: 123,
          watchedAt: DateTime.parse('2023-01-01T20:00:00.000Z'),
          sharing: Sharing(twitter: true, mastodon: true, tumblr: false),
          movie: Movie(title: 'Inception', year: 2010, ids: TraktIds(trakt: 1)),
        );

        final expectedJson = {
          'id': 123,
          'watched_at': '2023-01-01T20:00:00.000Z',
          'sharing': {'twitter': true, 'mastodon': true, 'tumblr': false},
          'movie': {
            'title': 'Inception',
            'year': 2010,
            'ids': {'trakt': 1},
          },
        };

        expect(checkinMovie.toJson(), expectedJson);
      });
    });
  });
}
