import 'package:test/test.dart';
import 'package:traktx/src/models/unknown_note_item.dart';

void main() {
  group('UnknownNoteItem', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {'type': 'unknown'};
        final item = UnknownNoteItem.fromJson(json);
        expect(item.type, 'unknown');
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final item = UnknownNoteItem(type: 'unknown');
        final expectedJson = {'type': 'unknown'};
        expect(item.toJson(), expectedJson);
      });
    });
  });
}
