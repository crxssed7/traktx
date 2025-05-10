import 'package:traktx/src/models/movie.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:test/test.dart';

void main() {
  group('Movie', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'title': 'Movie 1',
          'year': null,
          'ids': {'trakt': 1},
        };
        final movie = Movie.fromJson(json);
        expect(movie.title, 'Movie 1');
        expect(movie.year, null);
        expect(movie.ids.trakt, 1);
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final movie = Movie(
          title: 'Movie 1',
          year: 2025,
          ids: TraktIds(trakt: 12),
        );
        final expectedJson = {
          'title': 'Movie 1',
          'year': 2025,
          'ids': {'trakt': 12},
        };
        expect(movie.toJson(), expectedJson);
      });
    });
  });
}
