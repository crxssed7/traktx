import 'package:traktx/src/models/user_stats.dart';
import 'package:test/test.dart';

void main() {
  group('UserStats', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {'rating': null, 'play_count': 12, 'completed_count': 13};
        final userStats = UserStats.fromJson(json);
        expect(userStats.rating, null);
        expect(userStats.playCount, 12);
        expect(userStats.completedCount, 13);
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final userStats = UserStats(
          rating: 10,
          playCount: 12,
          completedCount: 13,
        );
        final expectedJson = {
          'rating': 10,
          'play_count': 12,
          'completed_count': 13,
        };
        expect(userStats.toJson(), expectedJson);
      });
    });
  });
}
