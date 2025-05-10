import 'package:traktx/src/models/episode.dart';
import 'package:test/test.dart';
import 'package:traktx/src/models/trakt_ids.dart';

void main() {
  group('Episode', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'title': 'Episode 1',
          'season': 1,
          'number': 1,
          'ids': {'trakt': 1},
        };
        final episode = Episode.fromJson(json);
        expect(episode.title, 'Episode 1');
        expect(episode.season, 1);
        expect(episode.number, 1);
        expect(episode.ids.trakt, 1);
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final episode = Episode(
          title: 'Episode 1',
          season: 1,
          number: 1,
          ids: TraktIds(trakt: 12),
        );
        final expectedJson = {
          'title': 'Episode 1',
          'season': 1,
          'number': 1,
          'ids': {'trakt': 12},
        };
        expect(episode.toJson(), expectedJson);
      });
    });
  });
}
