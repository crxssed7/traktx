import 'package:test/test.dart';
import 'package:traktx/src/models/episode_note_item.dart';
import 'package:traktx/src/models/episode.dart';
import 'package:traktx/src/models/trakt_ids.dart';

void main() {
  group('EpisodeNoteItem', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'type': 'episode',
          'episode': {
            'title': 'Winter Is Coming',
            'season': 1,
            'number': 1,
            'ids': {'trakt': 100},
          },
        };

        final item = EpisodeNoteItem.fromJson(json);
        expect(item.type, 'episode');
        expect(item.episode.title, 'Winter Is Coming');
        expect(item.episode.season, 1);
        expect(item.episode.number, 1);
        expect(item.episode.ids.trakt, 100);
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final episode = Episode(
          title: 'Winter Is Coming',
          season: 1,
          number: 1,
          ids: TraktIds(trakt: 100),
        );
        final item = EpisodeNoteItem(type: 'episode', episode: episode);

        final expectedJson = {
          'type': 'episode',
          'episode': {
            'title': 'Winter Is Coming',
            'season': 1,
            'number': 1,
            'ids': {'trakt': 100},
          },
        };

        expect(item.toJson(), expectedJson);
      });
    });
  });
}
