import 'package:test/test.dart';
import 'package:traktx/src/models/show_note_item.dart';
import 'package:traktx/src/models/show.dart';
import 'package:traktx/src/models/trakt_ids.dart';

void main() {
  group('ShowNoteItem', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'type': 'show',
          'show': {
            'title': 'Mr. Robot',
            'year': 2015,
            'ids': {'trakt': 123},
          },
        };

        final item = ShowNoteItem.fromJson(json);
        expect(item.type, 'show');
        expect(item.show.title, 'Mr. Robot');
        expect(item.show.year, 2015);
        expect(item.show.ids.trakt, 123);
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final show = Show(
          title: 'Mr. Robot',
          year: 2015,
          ids: TraktIds(trakt: 123),
        );
        final item = ShowNoteItem(type: 'show', show: show);

        final expectedJson = {
          'type': 'show',
          'show': {
            'title': 'Mr. Robot',
            'year': 2015,
            'ids': {'trakt': 123},
          },
        };

        expect(item.toJson(), expectedJson);
      });
    });
  });
}
