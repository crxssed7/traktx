import 'package:test/test.dart';
import 'package:traktx/src/models/movie.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:traktx/src/requests/note_movie_request.dart';

void main() {
  group('NoteMovieRequest', () {
    final movie = Movie(
      title: 'Inception',
      year: 2010,
      ids: TraktIds(trakt: 123),
    );

    group('fromJson', () {
      test('it converts json with all fields', () {
        final json = {
          'movie': {
            'title': 'Inception',
            'year': 2010,
            'ids': {'trakt': 123},
          },
          'note': 'Amazing movie!',
          'spoiler': false,
          'privacy': 'public',
        };

        final req = NoteMovieRequest.fromJson(json);

        expect(req.note, 'Amazing movie!');
        expect(req.spoiler, false);
        expect(req.privacy, 'public');
        expect(req.movie.title, 'Inception');
        expect(req.movie.year, 2010);
        expect(req.movie.ids.trakt, 123);
      });

      test('it handles missing optional fields (spoiler, privacy)', () {
        final json = {
          'movie': {
            'title': 'Inception',
            'year': 2010,
            'ids': {'trakt': 123},
          },
          'note': 'Amazing movie!',
        };

        final req = NoteMovieRequest.fromJson(json);

        expect(req.note, 'Amazing movie!');
        expect(req.spoiler, isNull);
        expect(req.privacy, isNull);
        expect(req.movie.title, 'Inception');
        expect(req.movie.year, 2010);
        expect(req.movie.ids.trakt, 123);
      });
    });

    group('toJson', () {
      test('it converts to json with all fields', () {
        final req = NoteMovieRequest(
          movie: movie,
          note: 'Amazing movie!',
          spoiler: false,
          privacy: 'friends',
        );

        final expectedJson = {
          'movie': {
            'title': 'Inception',
            'year': 2010,
            'ids': {'trakt': 123},
          },
          'note': 'Amazing movie!',
          'spoiler': false,
          'privacy': 'friends',
        };

        expect(req.toJson(), expectedJson);
      });

      test('it omits null fields', () {
        final req = NoteMovieRequest(movie: movie, note: 'Great movie!');

        final json = req.toJson();

        expect(json['note'], 'Great movie!');
        expect(json['spoiler'], isNull);
        expect(json['privacy'], isNull);
        expect(json.containsKey('spoiler'), isFalse);
        expect(json.containsKey('privacy'), isFalse);
      });
    });
  });
}
