import 'package:traktx/src/models/show_list_item.dart';
import 'package:traktx/src/models/show.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:test/test.dart';

void main() {
  group('ShowListItem', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'rank': 1,
          'id': 123,
          'listed_at': '2025-05-11T12:00:00Z',
          'type': 'show',
          'show': {
            'title': 'Breaking Bad',
            'year': 2008,
            'ids': {'trakt': 123, 'tmdb': 456, 'imdb': 'tt0903747'},
          },
        };
        final showListItem = ShowListItem.fromJson(json);

        expect(showListItem.rank, 1);
        expect(showListItem.id, 123);
        expect(showListItem.listedAt, DateTime.parse('2025-05-11T12:00:00Z'));
        expect(showListItem.type, 'show');
        expect(showListItem.show.title, 'Breaking Bad');
        expect(showListItem.show.year, 2008);
        expect(showListItem.show.ids.trakt, 123);
        expect(showListItem.show.ids.tmdb, 456);
        expect(showListItem.show.ids.imdb, 'tt0903747');
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final show = Show(
          title: 'Breaking Bad',
          year: 2008,
          ids: TraktIds(trakt: 123, tmdb: 456, imdb: 'tt0903747'),
        );
        final showListItem = ShowListItem(
          rank: 1,
          id: 123,
          listedAt: DateTime.parse('2025-05-11T12:00:00Z'),
          type: 'show',
          show: show,
        );
        final expectedJson = {
          'rank': 1,
          'id': 123,
          'listed_at': '2025-05-11T12:00:00.000Z',
          'type': 'show',
          'show': {
            'title': 'Breaking Bad',
            'year': 2008,
            'ids': {'trakt': 123, 'tmdb': 456, 'imdb': 'tt0903747'},
          },
        };

        expect(showListItem.toJson(), expectedJson);
      });
    });
  });
}
