import 'dart:convert';

import 'package:traktx/src/core/client.dart';
import 'package:traktx/src/models/calendar_movie.dart';
import 'package:traktx/src/models/calendar_show.dart';

class CalendarsService {
  final Client _client;

  CalendarsService(this._client);

  Future<List<CalendarShow>> shows(
    String type, {
    DateTime? startDate,
    int days = 7,
  }) async {
    final path = _buildPath('shows', type, startDate, days);
    return _sendShowsRequest(path);
  }

  Future<List<CalendarShow>> newShows(
    String type, {
    DateTime? startDate,
    int days = 7,
  }) async {
    final path = _buildPath('shows/new', type, startDate, days);
    return _sendShowsRequest(path);
  }

  Future<List<CalendarShow>> premieres(
    String type, {
    DateTime? startDate,
    int days = 7,
  }) async {
    final path = _buildPath('shows/premieres', type, startDate, days);
    return _sendShowsRequest(path);
  }

  Future<List<CalendarShow>> finales(
    String type, {
    DateTime? startDate,
    int days = 7,
  }) async {
    final path = _buildPath('shows/finales', type, startDate, days);
    return _sendShowsRequest(path);
  }

  Future<List<CalendarMovie>> movies(
    String type, {
    DateTime? startDate,
    int days = 7,
  }) async {
    final path = _buildPath('movies', type, startDate, days);
    return _sendMoviesRequest(path);
  }

  Future<List<CalendarMovie>> dvd(
    String type, {
    DateTime? startDate,
    int days = 7,
  }) async {
    final path = _buildPath('dvd', type, startDate, days);
    return _sendMoviesRequest(path);
  }

  Future<List<CalendarShow>> _sendShowsRequest(String path) async {
    return _sendRequest<CalendarShow>(path, CalendarShow.fromJson);
  }

  Future<List<CalendarMovie>> _sendMoviesRequest(String path) async {
    return _sendRequest<CalendarMovie>(path, CalendarMovie.fromJson);
  }

  Future<List<T>> _sendRequest<T>(
    String path,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final response = await _client.get(path);
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }

  String _buildPath(
    String endpoint,
    String type,
    DateTime? startDate,
    int days,
  ) {
    var path = '/calendars/$type/$endpoint';
    if (startDate != null) {
      final date = '${startDate.year}-${startDate.month}-${startDate.day}';
      path = '$path/$date/$days';
    }
    return path;
  }
}
