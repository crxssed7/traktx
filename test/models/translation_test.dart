import 'package:test/test.dart';
import 'package:traktx/src/models/translation.dart';

void main() {
  group('Translation', () {
    group('fromJson', () {
      test('it converts json to Translation with all fields', () {
        final json = {
          'title': 'Inception',
          'overview': 'A mind-bending thriller.',
          'tagline': 'Your mind is the scene of the crime.',
          'language': 'en',
          'country': 'us',
        };

        final translation = Translation.fromJson(json);

        expect(translation.title, 'Inception');
        expect(translation.overview, 'A mind-bending thriller.');
        expect(translation.tagline, 'Your mind is the scene of the crime.');
        expect(translation.language, 'en');
        expect(translation.country, 'us');
      });

      test('it handles missing optional fields', () {
        final json = {'language': 'fr', 'country': 'ca'};

        final translation = Translation.fromJson(json);

        expect(translation.title, isNull);
        expect(translation.overview, isNull);
        expect(translation.tagline, isNull);
        expect(translation.language, 'fr');
        expect(translation.country, 'ca');
      });
    });

    group('toJson', () {
      test('it converts Translation to json with all fields', () {
        final translation = Translation(
          title: 'Inception',
          overview: 'A mind-bending thriller.',
          tagline: 'Your mind is the scene of the crime.',
          language: 'en',
          country: 'us',
        );

        final json = translation.toJson();

        expect(json, {
          'title': 'Inception',
          'overview': 'A mind-bending thriller.',
          'tagline': 'Your mind is the scene of the crime.',
          'language': 'en',
          'country': 'us',
        });
      });

      test('it includes nulls by default in toJson', () {
        final translation = Translation(
          title: null,
          overview: null,
          tagline: null,
          language: 'ja',
          country: 'jp',
        );

        final json = translation.toJson();

        expect(json, {
          'title': null,
          'overview': null,
          'tagline': null,
          'language': 'ja',
          'country': 'jp',
        });
      });
    });
  });
}
