import 'package:test/test.dart';
import 'package:traktx/src/models/video.dart';

void main() {
  group('Video', () {
    group('fromJson', () {
      test('it converts json to Video with all fields', () {
        final json = {
          'title': 'Official Trailer',
          'url': 'https://www.youtube.com/watch?v=abcd1234',
          'site': 'YouTube',
          'type': 'trailer',
          'size': 1080,
          'official': true,
          'published_at': '2023-10-01T12:00:00Z',
          'country': 'us',
          'language': 'en',
        };

        final video = Video.fromJson(json);

        expect(video.title, 'Official Trailer');
        expect(video.url, 'https://www.youtube.com/watch?v=abcd1234');
        expect(video.site, 'YouTube');
        expect(video.type, 'trailer');
        expect(video.size, 1080);
        expect(video.official, true);
        expect(video.publishedAt.toUtc(), DateTime.utc(2023, 10, 1, 12, 0, 0));
        expect(video.country, 'us');
        expect(video.language, 'en');
      });

      test('it handles missing optional fields', () {
        final json = {
          'title': 'Teaser',
          'url': 'https://example.com/teaser',
          'site': 'Vimeo',
          'type': 'teaser',
          'size': 720,
          'official': false,
          'published_at': '2024-01-15T08:30:00Z',
        };

        final video = Video.fromJson(json);

        expect(video.title, 'Teaser');
        expect(video.url, 'https://example.com/teaser');
        expect(video.site, 'Vimeo');
        expect(video.type, 'teaser');
        expect(video.size, 720);
        expect(video.official, false);
        expect(video.publishedAt.toUtc(), DateTime.utc(2024, 1, 15, 8, 30, 0));
        expect(video.country, isNull);
        expect(video.language, isNull);
      });
    });

    group('toJson', () {
      test('it converts Video to json with all fields', () {
        final video = Video(
          title: 'Official Trailer',
          url: 'https://www.youtube.com/watch?v=abcd1234',
          site: 'YouTube',
          type: 'trailer',
          size: 1080,
          official: true,
          publishedAt: DateTime.utc(2023, 10, 1, 12, 0, 0),
          country: 'us',
          language: 'en',
        );

        final json = video.toJson();

        expect(json, {
          'title': 'Official Trailer',
          'url': 'https://www.youtube.com/watch?v=abcd1234',
          'site': 'YouTube',
          'type': 'trailer',
          'size': 1080,
          'official': true,
          'published_at': '2023-10-01T12:00:00.000Z',
          'country': 'us',
          'language': 'en',
        });
      });

      test('it includes nulls in toJson for optional fields', () {
        final video = Video(
          title: 'Clip',
          url: 'https://example.com/clip',
          site: 'Vimeo',
          type: 'clip',
          size: 480,
          official: false,
          publishedAt: DateTime.utc(2022, 5, 20, 15, 45, 0),
          country: null,
          language: null,
        );

        final json = video.toJson();

        expect(json, {
          'title': 'Clip',
          'url': 'https://example.com/clip',
          'site': 'Vimeo',
          'type': 'clip',
          'size': 480,
          'official': false,
          'published_at': '2022-05-20T15:45:00.000Z',
          'country': null,
          'language': null,
        });
      });
    });
  });
}
