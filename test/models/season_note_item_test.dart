import 'package:test/test.dart';
import 'package:traktx/src/models/season_note_item.dart';
import 'package:traktx/src/models/season.dart';
import 'package:traktx/src/models/trakt_ids.dart';

void main() {
  group('SeasonNoteItem', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'type': 'season',
          'season': {
            'number': 2,
            'ids': {'trakt': 101},
          },
        };

        final item = SeasonNoteItem.fromJson(json);
        expect(item.type, 'season');
        expect(item.season.number, 2);
        expect(item.season.ids.trakt, 101);
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final season = Season(number: 2, ids: TraktIds(trakt: 101));
        final item = SeasonNoteItem(type: 'season', season: season);

        final expectedJson = {
          'type': 'season',
          'season': {
            'number': 2,
            'ids': {'trakt': 101},
          },
        };

        expect(item.toJson(), expectedJson);
      });
    });
  });
}
