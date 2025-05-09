import 'package:traktx/src/models/trakt_ids.dart';
import 'package:test/test.dart';

void main() {
  group('TraktIds', () {
    group('fromJson', () {
      test('it converts json when only required fields are present', () {
        final json = {'trakt': 123, 'tmdb': 123};
        final ids = TraktIds.fromJson(json);
        expect(ids.trakt, 123);
        expect(ids.tmdb, 123);
        expect(ids.slug, null);
        expect(ids.imdb, null);
        expect(ids.tvdb, null);
      });

      test('it converts json when all fields are present', () {
        final json = {
          'trakt': 123,
          'tmdb': 123,
          'slug': 'test',
          'imdb': 'tt1234',
          'tvdb': 123,
        };
        final ids = TraktIds.fromJson(json);
        expect(ids.trakt, 123);
        expect(ids.tmdb, 123);
        expect(ids.slug, 'test');
        expect(ids.imdb, 'tt1234');
        expect(ids.tvdb, 123);
      });
    });

    group('toJson', () {
      test('it does not include null keys', () {
        final ids = TraktIds(tmdb: 123, trakt: 123);
        final expectedJson = {'trakt': 123, 'tmdb': 123};
        expect(ids.toJson(), expectedJson);
      });

      test('it converts to json', () {
        final ids = TraktIds(
          tmdb: 123,
          trakt: 123,
          slug: 'test',
          imdb: 'test',
          tvdb: 123,
        );
        final expectedJson = {
          'trakt': 123,
          'tmdb': 123,
          'slug': 'test',
          'imdb': 'test',
          'tvdb': 123,
        };
        expect(ids.toJson(), expectedJson);
      });
    });
  });
}
