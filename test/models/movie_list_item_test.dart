import 'package:traktx/src/models/movie_list_item.dart';
import 'package:traktx/src/models/movie.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:test/test.dart';

void main() {
  group('MovieListItem', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'rank': 1,
          'id': 123,
          'listed_at': '2025-05-11T12:00:00Z',
          'type': 'movie',
          'movie': {
            'title': 'Inception',
            'year': 2010,
            'ids': {'trakt': 123, 'tmdb': 456, 'imdb': 'tt1375666'},
          },
        };
        final movieListItem = MovieListItem.fromJson(json);

        expect(movieListItem.rank, 1);
        expect(movieListItem.id, 123);
        expect(movieListItem.listedAt, DateTime.parse('2025-05-11T12:00:00Z'));
        expect(movieListItem.type, 'movie');
        expect(movieListItem.movie.title, 'Inception');
        expect(movieListItem.movie.year, 2010);
        expect(movieListItem.movie.ids.trakt, 123);
        expect(movieListItem.movie.ids.tmdb, 456);
        expect(movieListItem.movie.ids.imdb, 'tt1375666');
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final movie = Movie(
          title: 'Inception',
          year: 2010,
          ids: TraktIds(trakt: 123, tmdb: 456, imdb: 'tt1375666'),
        );
        final movieListItem = MovieListItem(
          rank: 1,
          id: 123,
          listedAt: DateTime.parse('2025-05-11T12:00:00Z'),
          type: 'movie',
          movie: movie,
        );
        final expectedJson = {
          'rank': 1,
          'id': 123,
          'listed_at': '2025-05-11T12:00:00.000Z',
          'type': 'movie',
          'movie': {
            'title': 'Inception',
            'year': 2010,
            'ids': {'trakt': 123, 'tmdb': 456, 'imdb': 'tt1375666'},
          },
        };

        expect(movieListItem.toJson(), expectedJson);
      });
    });
  });
}
