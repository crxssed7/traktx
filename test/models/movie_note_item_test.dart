import 'package:test/test.dart';
import 'package:traktx/src/models/movie_note_item.dart';
import 'package:traktx/src/models/movie.dart';
import 'package:traktx/src/models/trakt_ids.dart';

void main() {
  group('MovieNoteItem', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'type': 'movie',
          'movie': {
            'title': 'Inception',
            'year': 2010,
            'ids': {'trakt': 42},
          },
        };

        final item = MovieNoteItem.fromJson(json);
        expect(item.type, 'movie');
        expect(item.movie.title, 'Inception');
        expect(item.movie.year, 2010);
        expect(item.movie.ids.trakt, 42);
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final movie = Movie(
          title: 'Inception',
          year: 2010,
          ids: TraktIds(trakt: 42),
        );
        final item = MovieNoteItem(type: 'movie', movie: movie);

        final expectedJson = {
          'type': 'movie',
          'movie': {
            'title': 'Inception',
            'year': 2010,
            'ids': {'trakt': 42},
          },
        };

        expect(item.toJson(), expectedJson);
      });
    });
  });
}
