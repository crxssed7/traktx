import 'package:traktx/src/services/calendars_service.dart';
import 'package:traktx/src/services/certifications_service.dart';
import 'package:traktx/src/services/checkin_service.dart';
import 'package:traktx/src/services/comments_service.dart';
import 'package:traktx/src/services/countries_service.dart';
import 'package:traktx/src/services/device_service.dart';
import 'package:traktx/src/services/genres_service.dart';
import 'package:traktx/src/services/languages_service.dart';
import 'package:traktx/src/services/lists_service.dart';
import 'package:traktx/src/services/movies_service.dart';
import 'package:traktx/src/services/networks_service.dart';
import 'package:traktx/src/services/notes_service.dart';
import 'package:traktx/src/services/oauth_service.dart';
import 'package:traktx/src/services/recommendations_service.dart';
import 'package:traktx/src/services/scrobble_service.dart';
import 'package:traktx/src/services/search_service.dart';
import 'package:traktx/src/services/seasons_service.dart';
import 'package:traktx/src/services/shows_service.dart';

import 'core/client.dart';

class Trakt {
  final Client _client;

  late final OauthService oauth;
  late final DeviceService device;
  late final CalendarsService calendars;
  late final CheckinService checkin;
  late final CertificationsService certifications;
  late final CommentsService comments;
  late final CountriesService countries;
  late final GenresService genres;
  late final LanguagesService languages;
  late final ListsService list;
  late final MoviesService movies;
  late final NetworksService networks;
  late final NotesService notes;
  late final RecommendationsService recommendations;
  late final ScrobbleService scrobble;
  late final SearchService search;
  late final ShowsService shows;
  late final SeasonsService seasons;

  String? _accessToken;

  Trakt({
    required String clientId,
    required String clientSecret,
    required String redirectUri,
    bool staging = false,
  }) : _client = Client(clientId, clientSecret, redirectUri, staging) {
    oauth = OauthService(_client);
    device = DeviceService(_client);
    calendars = CalendarsService(_client);
    checkin = CheckinService(_client);
    certifications = CertificationsService(_client);
    comments = CommentsService(_client);
    countries = CountriesService(_client);
    genres = GenresService(_client);
    languages = LanguagesService(_client);
    list = ListsService(_client);
    movies = MoviesService(_client);
    networks = NetworksService(_client);
    notes = NotesService(_client);
    recommendations = RecommendationsService(_client);
    scrobble = ScrobbleService(_client);
    search = SearchService(_client);
    shows = ShowsService(_client);
    seasons = SeasonsService(_client);
  }

  String? get accessToken {
    return _accessToken;
  }

  set accessToken(String? accessToken) {
    _client.accessToken = accessToken;
    _accessToken = accessToken;
  }
}
