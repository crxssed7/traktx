import 'package:traktx/src/models/season.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:test/test.dart';

void main() {
  group('Season', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'number': 1,
          'ids': {'trakt': 22026236, 'slug': 'mcu'},
        };

        final season = Season.fromJson(json);

        expect(season.number, 1);
        expect(season.ids.trakt, 22026236);
        expect(season.ids.slug, 'mcu');
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final traktIds = TraktIds(trakt: 22026236, slug: 'mcu');
        final season = Season(number: 1, ids: traktIds);
        final expectedJson = {
          'number': 1,
          'ids': {'trakt': 22026236, 'slug': 'mcu'},
        };
        expect(season.toJson(), expectedJson);
      });
    });
  });
}
