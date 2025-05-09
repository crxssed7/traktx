import 'package:traktx/traktx.dart';

void main() async {
  var trakt = Trakt(
    clientId: "YOUR-CLIENT-ID",
    clientSecret: "YOUR-CLIENT-SECRET",
    redirectUri: "urn:ietf:wg:oauth:2.0:oob",
  );

  print(trakt.oauth.buildOauthRedirectUrl());
}
