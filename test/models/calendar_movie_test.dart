import 'package:test/test.dart';
import 'package:traktx/src/models/calendar_movie.dart';
import 'package:traktx/src/models/movie.dart';
import 'package:traktx/src/models/trakt_ids.dart';

void main() {
  group('CalendarMovie', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'released': '2023-01-01T00:00:00.000Z',
          'movie': {
            'title': 'Inception',
            'year': 2010,
            'ids': {'trakt': 1},
          },
        };

        final calendarMovie = CalendarMovie.fromJson(json);
        expect(
          calendarMovie.released.toUtc().toIso8601String(),
          '2023-01-01T00:00:00.000Z',
        );
        expect(calendarMovie.movie.title, 'Inception');
        expect(calendarMovie.movie.year, 2010);
        expect(calendarMovie.movie.ids.trakt, 1);
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final calendarMovie = CalendarMovie(
          released: DateTime.parse('2023-01-01T00:00:00.000Z'),
          movie: Movie(title: 'Inception', year: 2010, ids: TraktIds(trakt: 1)),
        );

        final expectedJson = {
          'released': '2023-01-01T00:00:00.000Z',
          'movie': {
            'title': 'Inception',
            'year': 2010,
            'ids': {'trakt': 1},
          },
        };

        expect(calendarMovie.toJson(), expectedJson);
      });
    });
  });
}
