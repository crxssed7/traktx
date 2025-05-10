import 'package:test/test.dart';
import 'package:traktx/src/models/calendar_show.dart';
import 'package:traktx/src/models/show.dart';
import 'package:traktx/src/models/episode.dart';
import 'package:traktx/src/models/trakt_ids.dart';

void main() {
  group('CalendarShow', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'first_aired': '2023-01-01T20:00:00.000Z',
          'episode': {
            'title': 'Pilot',
            'season': 1,
            'number': 1,
            'ids': {'trakt': 100},
          },
          'show': {
            'title': 'Breaking Bad',
            'year': 2008,
            'ids': {'trakt': 200},
          },
        };

        final calendarShow = CalendarShow.fromJson(json);
        expect(
          calendarShow.firstAired.toUtc().toIso8601String(),
          '2023-01-01T20:00:00.000Z',
        );
        expect(calendarShow.episode.title, 'Pilot');
        expect(calendarShow.episode.season, 1);
        expect(calendarShow.episode.number, 1);
        expect(calendarShow.episode.ids.trakt, 100);
        expect(calendarShow.show.title, 'Breaking Bad');
        expect(calendarShow.show.year, 2008);
        expect(calendarShow.show.ids.trakt, 200);
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final calendarShow = CalendarShow(
          firstAired: DateTime.parse('2023-01-01T20:00:00.000Z'),
          episode: Episode(
            title: 'Pilot',
            season: 1,
            number: 1,
            ids: TraktIds(trakt: 100),
          ),
          show: Show(
            title: 'Breaking Bad',
            year: 2008,
            ids: TraktIds(trakt: 200),
          ),
        );

        final expectedJson = {
          'first_aired': '2023-01-01T20:00:00.000Z',
          'episode': {
            'title': 'Pilot',
            'season': 1,
            'number': 1,
            'ids': {'trakt': 100},
          },
          'show': {
            'title': 'Breaking Bad',
            'year': 2008,
            'ids': {'trakt': 200},
          },
        };

        expect(calendarShow.toJson(), expectedJson);
      });
    });
  });
}
