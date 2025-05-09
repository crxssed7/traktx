import 'package:traktx/src/models/network.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:test/test.dart';

void main() {
  group('Network', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'name': 'BBC',
          'country': null,
          'ids': {'trakt': 123, 'tmdb': 123},
        };
        final network = Network.fromJson(json);
        expect(network.name, 'BBC');
        expect(network.country, null);
        expect(network.ids.trakt, 123);
        expect(network.ids.tmdb, 123);
        expect(network.ids.slug, null);
        expect(network.ids.imdb, null);
        expect(network.ids.tvdb, null);
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final ids = TraktIds(tmdb: 123, trakt: 123);
        final network = Network(name: 'BBC', country: 'gb', ids: ids);
        final expectedJson = {
          'name': 'BBC',
          'country': 'gb',
          'ids': {'trakt': 123, 'tmdb': 123},
        };
        expect(network.toJson(), expectedJson);
      });
    });
  });
}
