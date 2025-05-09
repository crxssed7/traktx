import 'package:traktx/traktx.dart';

void main() async {
  var trakt = Trakt(clientId: "YOUR-CLIENT-ID");

  final certs = await trakt.networks.list();
  for (var cert in certs) {
    print("${cert.name}: ${cert.country}");
  }
}
