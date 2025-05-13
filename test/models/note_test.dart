import 'package:test/test.dart';
import 'package:traktx/src/models/note.dart';
import 'package:traktx/src/models/user.dart';
import 'package:traktx/src/models/trakt_ids.dart';

void main() {
  group('Note', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'id': 10,
          'notes': 'Excited for the next episode!',
          'privacy': 'friends',
          'spoiler': true,
          'created_at': '2024-05-01T10:00:00.000Z',
          'updated_at': '2024-05-02T11:00:00.000Z',
          'user': {
            'username': 'crxssed',
            'private': false,
            'name': 'Tanveer Najib',
            'vip': true,
            'vip_ep': false,
            'ids': {'trakt': 1},
          },
        };

        final note = Note.fromJson(json);
        expect(note.id, 10);
        expect(note.notes, 'Excited for the next episode!');
        expect(note.privacy, 'friends');
        expect(note.spoiler, true);
        expect(note.createdAt.toUtc(), DateTime.utc(2024, 5, 1, 10));
        expect(note.updatedAt.toUtc(), DateTime.utc(2024, 5, 2, 11));

        expect(note.user.username, 'crxssed');
        expect(note.user.private, false);
        expect(note.user.name, 'Tanveer Najib');
        expect(note.user.vip, true);
        expect(note.user.vipEp, false);
        expect(note.user.ids.trakt, 1);
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final user = User(
          username: 'crxssed',
          private: false,
          name: 'Tanveer Najib',
          vip: true,
          vipEp: false,
          ids: TraktIds(trakt: 1),
        );

        final note = Note(
          id: 10,
          notes: 'Excited for the next episode!',
          privacy: 'friends',
          spoiler: true,
          createdAt: DateTime.utc(2024, 5, 1, 10),
          updatedAt: DateTime.utc(2024, 5, 2, 11),
          user: user,
        );

        final expectedJson = {
          'id': 10,
          'notes': 'Excited for the next episode!',
          'privacy': 'friends',
          'spoiler': true,
          'created_at': '2024-05-01T10:00:00.000Z',
          'updated_at': '2024-05-02T11:00:00.000Z',
          'user': {
            'username': 'crxssed',
            'private': false,
            'name': 'Tanveer Najib',
            'vip': true,
            'vip_ep': false,
            'ids': {'trakt': 1},
          },
        };

        expect(note.toJson(), expectedJson);
      });
    });
  });
}
