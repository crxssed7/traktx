import 'package:traktx/src/models/user.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:test/test.dart';

void main() {
  group('User', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'username': 'crxssed',
          'private': false,
          'name': 'Tanveer Najib',
          'vip': true,
          'vip_ep': false,
          'ids': {'trakt': 1},
        };
        final user = User.fromJson(json);
        expect(user.username, 'crxssed');
        expect(user.private, false);
        expect(user.name, 'Tanveer Najib');
        expect(user.vip, true);
        expect(user.vipEp, false);
        expect(user.ids.trakt, 1);
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
        final expectedJson = {
          'username': 'crxssed',
          'private': false,
          'name': 'Tanveer Najib',
          'vip': true,
          'vip_ep': false,
          'ids': {'trakt': 1},
        };
        expect(user.toJson(), expectedJson);
      });
    });
  });
}
