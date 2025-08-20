import 'package:traktx/traktx.dart';

void main() async {
  var trakt = Trakt(
    clientId:
        "80385a95267fd85c22d380c508ee1aa687fc0aba899e3433a7df977ce0062e56",
    clientSecret:
        "5295c938ca127f470d7bf26f77b83e14410c7cb8d400835bf190b74049078ae8",
    redirectUri: "urn:ietf:wg:oauth:2.0:oob",
  );

  trakt.accessToken =
      "1c9d6a75ec27d459cc4afbf19dc8e63e605781046a6c2bfcd5ed9755efa1c17c";

  final res = await trakt.search.text("list", "tron");
  // print(res.toJson());
  for (var r in res) {
    print(r.toJson());
  }
}
