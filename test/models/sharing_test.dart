import 'package:traktx/src/models/sharing.dart';
import 'package:test/test.dart';

void main() {
  group('Sharing', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {'twitter': false, 'mastodon': false, 'tumblr': false};
        final sharing = Sharing.fromJson(json);
        expect(sharing.twitter, false);
        expect(sharing.mastodon, false);
        expect(sharing.tumblr, false);
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final sharing = Sharing(twitter: true, mastodon: true, tumblr: true);
        final expectedJson = {
          'twitter': true,
          'mastodon': true,
          'tumblr': true,
        };
        expect(sharing.toJson(), expectedJson);
      });
    });
  });
}
