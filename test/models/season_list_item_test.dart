import 'package:traktx/src/models/season_list_item.dart';
import 'package:traktx/src/models/season.dart';
import 'package:traktx/src/models/show.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:test/test.dart';

void main() {
  group('SeasonListItem', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'rank': 1,
          'id': 123,
          'listed_at': '2025-05-11T12:00:00Z',
          'type': 'season',
          'season': {
            'number': 1,
            'ids': {'trakt': 123, 'tmdb': 456, 'imdb': 'tt0903747'},
          },
          'show': {
            'title': 'Breaking Bad',
            'year': 2008,
            'ids': {'trakt': 123, 'tmdb': 456, 'imdb': 'tt0903747'},
          },
        };
        final seasonListItem = SeasonListItem.fromJson(json);

        expect(seasonListItem.rank, 1);
        expect(seasonListItem.id, 123);
        expect(seasonListItem.listedAt, DateTime.parse('2025-05-11T12:00:00Z'));
        expect(seasonListItem.type, 'season');
        expect(seasonListItem.season.number, 1);
        expect(seasonListItem.season.ids.trakt, 123);
        expect(seasonListItem.season.ids.tmdb, 456);
        expect(seasonListItem.season.ids.imdb, 'tt0903747');
        expect(seasonListItem.show.title, 'Breaking Bad');
        expect(seasonListItem.show.year, 2008);
        expect(seasonListItem.show.ids.trakt, 123);
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final season = Season(
          number: 1,
          ids: TraktIds(trakt: 123, tmdb: 456, imdb: 'tt0903747'),
        );
        final show = Show(
          title: 'Breaking Bad',
          year: 2008,
          ids: TraktIds(trakt: 123, tmdb: 456, imdb: 'tt0903747'),
        );
        final seasonListItem = SeasonListItem(
          rank: 1,
          id: 123,
          listedAt: DateTime.parse('2025-05-11T12:00:00Z'),
          type: 'season',
          season: season,
          show: show,
        );
        final expectedJson = {
          'rank': 1,
          'id': 123,
          'listed_at': '2025-05-11T12:00:00.000Z',
          'type': 'season',
          'season': {
            'number': 1,
            'ids': {'trakt': 123, 'tmdb': 456, 'imdb': 'tt0903747'},
          },
          'show': {
            'title': 'Breaking Bad',
            'year': 2008,
            'ids': {'trakt': 123, 'tmdb': 456, 'imdb': 'tt0903747'},
          },
        };

        expect(seasonListItem.toJson(), expectedJson);
      });
    });
  });
}
