import 'package:traktx/src/services/certifications_service.dart';
import 'package:traktx/src/services/countries_service.dart';
import 'package:traktx/src/services/device_service.dart';
import 'package:traktx/src/services/genres_service.dart';
import 'package:traktx/src/services/languages_service.dart';
import 'package:traktx/src/services/networks_service.dart';
import 'package:traktx/src/services/oauth_service.dart';

import 'core/client.dart';

class Trakt {
  final Client _client;

  late final OauthService oauth;
  late final DeviceService device;
  late final CertificationsService certifications;
  late final CountriesService countries;
  late final GenresService genres;
  late final LanguagesService languages;
  late final NetworksService networks;

  String? _accessToken;

  Trakt({
    required String clientId,
    required String clientSecret,
    required String redirectUri,
  }) : _client = Client(clientId, clientSecret, redirectUri) {
    oauth = OauthService(_client);
    device = DeviceService(_client);
    certifications = CertificationsService(_client);
    countries = CountriesService(_client);
    genres = GenresService(_client);
    languages = LanguagesService(_client);
    networks = NetworksService(_client);
  }

  String? get accessToken {
    return _accessToken;
  }

  set accessToken(String? accessToken) {
    _client.accessToken = accessToken;
    _accessToken = accessToken;
  }
}
