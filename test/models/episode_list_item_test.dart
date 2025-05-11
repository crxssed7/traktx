import 'package:traktx/src/models/episode_list_item.dart';
import 'package:traktx/src/models/episode.dart';
import 'package:traktx/src/models/show.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:test/test.dart';

void main() {
  group('EpisodeListItem', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'rank': 1,
          'id': 123,
          'listed_at': '2025-05-11T12:00:00Z',
          'type': 'episode',
          'episode': {
            'title': 'Pilot',
            'season': 1,
            'number': 1,
            'ids': {'trakt': 123, 'tmdb': 456, 'imdb': 'tt0903747'},
          },
          'show': {
            'title': 'Breaking Bad',
            'year': 2008,
            'ids': {'trakt': 123, 'tmdb': 456, 'imdb': 'tt0903747'},
          },
        };
        final episodeListItem = EpisodeListItem.fromJson(json);

        expect(episodeListItem.rank, 1);
        expect(episodeListItem.id, 123);
        expect(
          episodeListItem.listedAt,
          DateTime.parse('2025-05-11T12:00:00Z'),
        );
        expect(episodeListItem.type, 'episode');
        expect(episodeListItem.episode.title, 'Pilot');
        expect(episodeListItem.episode.season, 1);
        expect(episodeListItem.episode.number, 1);
        expect(episodeListItem.episode.ids.trakt, 123);
        expect(episodeListItem.episode.ids.tmdb, 456);
        expect(episodeListItem.episode.ids.imdb, 'tt0903747');
        expect(episodeListItem.show.title, 'Breaking Bad');
        expect(episodeListItem.show.year, 2008);
        expect(episodeListItem.show.ids.trakt, 123);
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final episode = Episode(
          title: 'Pilot',
          season: 1,
          number: 1,
          ids: TraktIds(trakt: 123, tmdb: 456, imdb: 'tt0903747'),
        );
        final show = Show(
          title: 'Breaking Bad',
          year: 2008,
          ids: TraktIds(trakt: 123, tmdb: 456, imdb: 'tt0903747'),
        );
        final episodeListItem = EpisodeListItem(
          rank: 1,
          id: 123,
          listedAt: DateTime.parse('2025-05-11T12:00:00Z'),
          type: 'episode',
          episode: episode,
          show: show,
        );
        final expectedJson = {
          'rank': 1,
          'id': 123,
          'listed_at': '2025-05-11T12:00:00.000Z',
          'type': 'episode',
          'episode': {
            'title': 'Pilot',
            'season': 1,
            'number': 1,
            'ids': {'trakt': 123, 'tmdb': 456, 'imdb': 'tt0903747'},
          },
          'show': {
            'title': 'Breaking Bad',
            'year': 2008,
            'ids': {'trakt': 123, 'tmdb': 456, 'imdb': 'tt0903747'},
          },
        };

        expect(episodeListItem.toJson(), expectedJson);
      });
    });
  });
}
