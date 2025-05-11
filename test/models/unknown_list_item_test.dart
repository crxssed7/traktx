import 'package:traktx/src/models/unknown_list_item.dart';
import 'package:test/test.dart';

void main() {
  group('UnknownListItem', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'rank': 1,
          'id': 123,
          'listed_at': '2025-05-11T12:00:00Z',
          'type': 'unknown',
        };
        final unknownListItem = UnknownListItem.fromJson(json);

        expect(unknownListItem.rank, 1);
        expect(unknownListItem.id, 123);
        expect(
          unknownListItem.listedAt,
          DateTime.parse('2025-05-11T12:00:00Z'),
        );
        expect(unknownListItem.type, 'unknown');
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final unknownListItem = UnknownListItem(
          rank: 1,
          id: 123,
          listedAt: DateTime.parse('2025-05-11T12:00:00Z'),
          type: 'unknown',
        );
        final expectedJson = {
          'rank': 1,
          'id': 123,
          'listed_at': '2025-05-11T12:00:00.000Z',
          'type': 'unknown',
        };

        expect(unknownListItem.toJson(), expectedJson);
      });
    });
  });
}
