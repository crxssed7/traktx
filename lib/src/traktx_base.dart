import 'package:traktx/src/services/certifications_service.dart';
import 'package:traktx/src/services/countries_service.dart';
import 'package:traktx/src/services/genres_service.dart';
import 'package:traktx/src/services/languages_service.dart';
import 'package:traktx/src/services/networks_service.dart';

import 'core/client.dart';

class Trakt {
  final Client _client;

  late final CertificationsService certifications;
  late final CountriesService countries;
  late final GenresService genres;
  late final LanguagesService languages;
  late final NetworksService networks;

  Trakt({required String clientId}) : _client = Client(clientId) {
    certifications = CertificationsService(_client);
    countries = CountriesService(_client);
    genres = GenresService(_client);
    languages = LanguagesService(_client);
    networks = NetworksService(_client);
  }
}
