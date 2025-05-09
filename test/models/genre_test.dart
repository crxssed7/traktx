import 'package:traktx/src/models/genre.dart';
import 'package:test/test.dart';

void main() {
  group('Genre', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {'name': 'Action', 'slug': 'action'};
        final genre = Genre.fromJson(json);
        expect(genre.name, 'Action');
        expect(genre.slug, 'action');
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final genre = Genre(name: 'Action', slug: 'action');
        final expectedJson = {'name': 'Action', 'slug': 'action'};
        expect(genre.toJson(), expectedJson);
      });
    });
  });
}
