import 'package:test/test.dart';
import 'package:traktx/src/models/release.dart';

void main() {
  group('Release', () {
    group('fromJson', () {
      test('it converts json to Release with certification', () {
        final json = {
          'country': 'us',
          'certification': 'PG-13',
          'release_date': '2023-07-15T00:00:00.000Z',
          'release_type': 'theatrical',
        };

        final release = Release.fromJson(json);

        expect(release.country, 'us');
        expect(release.certification, 'PG-13');
        expect(
          release.releaseDate.toUtc(),
          DateTime.utc(2023, 7, 15),
        ); // time zone-safe
        expect(release.releaseType, 'theatrical');
      });

      test('it converts json to Release with null certification', () {
        final json = {
          'country': 'gb',
          'certification': null,
          'release_date': '2022-12-01T00:00:00.000Z',
          'release_type': 'digital',
        };

        final release = Release.fromJson(json);

        expect(release.country, 'gb');
        expect(release.certification, isNull);
        expect(release.releaseDate.toUtc(), DateTime.utc(2022, 12, 1));
        expect(release.releaseType, 'digital');
      });
    });

    group('toJson', () {
      test('it converts Release to json with certification', () {
        final release = Release(
          country: 'us',
          certification: 'R',
          releaseDate: DateTime.utc(2021, 5, 20),
          releaseType: 'blu-ray',
        );

        final json = release.toJson();

        expect(json, {
          'country': 'us',
          'certification': 'R',
          'release_date': '2021-05-20T00:00:00.000Z',
          'release_type': 'blu-ray',
        });
      });

      test('it converts Release to json with null certification', () {
        final release = Release(
          country: 'fr',
          certification: null,
          releaseDate: DateTime.utc(2020, 10, 31),
          releaseType: 'theatrical_limited',
        );

        final json = release.toJson();

        expect(json, {
          'country': 'fr',
          'certification': null,
          'release_date': '2020-10-31T00:00:00.000Z',
          'release_type': 'theatrical_limited',
        });
      });
    });
  });
}
