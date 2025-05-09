import 'package:traktx/src/models/certification.dart';
import 'package:test/test.dart';

void main() {
  group('Certification', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'name': 'Test Name',
          'slug': 'Test Slug',
          'description': 'Test Description',
        };
        final cert = Certification.fromJson(json);
        expect(cert.name, 'Test Name');
        expect(cert.slug, 'Test Slug');
        expect(cert.description, 'Test Description');
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final cert = Certification(
          name: 'Test Name',
          slug: 'Test Slug',
          description: 'Test Description',
        );
        final expectedJson = {
          'name': 'Test Name',
          'slug': 'Test Slug',
          'description': 'Test Description',
        };
        expect(cert.toJson(), expectedJson);
      });
    });
  });
}
