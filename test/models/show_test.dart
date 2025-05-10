import 'package:traktx/src/models/show.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:test/test.dart';

void main() {
  group('Show', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'title': 'Show 1',
          'year': 2003,
          'ids': {'trakt': 1},
        };
        final show = Show.fromJson(json);
        expect(show.title, 'Show 1');
        expect(show.year, 2003);
        expect(show.ids.trakt, 1);
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final show = Show(
          title: 'Show 1',
          year: 2025,
          ids: TraktIds(trakt: 12),
        );
        final expectedJson = {
          'title': 'Show 1',
          'year': 2025,
          'ids': {'trakt': 12},
        };
        expect(show.toJson(), expectedJson);
      });
    });
  });
}
