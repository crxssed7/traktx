import 'package:test/test.dart';
import 'package:traktx/src/models/ratings.dart';

void main() {
  group('Ratings', () {
    group('fromJson', () {
      test('it converts json to Ratings', () {
        final json = {
          'rating': 8.7,
          'votes': 1200,
          'distribution': {
            '1': 2,
            '2': 4,
            '3': 6,
            '4': 10,
            '5': 15,
            '6': 50,
            '7': 120,
            '8': 300,
            '9': 400,
            '10': 293,
          },
        };

        final ratings = Ratings.fromJson(json);

        expect(ratings.rating, 8.7);
        expect(ratings.votes, 1200);
        expect(ratings.distribution['10'], 293);
        expect(ratings.distribution.length, 10);
      });
    });

    group('toJson', () {
      test('it converts Ratings to json', () {
        final ratings = Ratings(
          rating: 8.7,
          votes: 1200,
          distribution: {
            '1': 2,
            '2': 4,
            '3': 6,
            '4': 10,
            '5': 15,
            '6': 50,
            '7': 120,
            '8': 300,
            '9': 400,
            '10': 293,
          },
        );

        final json = ratings.toJson();

        expect(json, {
          'rating': 8.7,
          'votes': 1200,
          'distribution': {
            '1': 2,
            '2': 4,
            '3': 6,
            '4': 10,
            '5': 15,
            '6': 50,
            '7': 120,
            '8': 300,
            '9': 400,
            '10': 293,
          },
        });
      });
    });
  });
}
