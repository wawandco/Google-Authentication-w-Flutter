import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthService {
  Future<void> signInWeb();
  Future<void> signIn();
  Future<void> signOut();
}

class _GoogleOAuthService extends AuthService {
  static const String _webClientID =
      String.fromEnvironment("GOOGLE_WEB_CLIENT_ID");

  final GoogleSignIn _client;

  _GoogleOAuthService()
      : _client = GoogleSignIn(
          clientId: kIsWeb ? _webClientID : null,
          serverClientId: !kIsWeb ? _webClientID : null,
        );

  @override
  Future<void> signInWeb() async =>
      _client.onCurrentUserChanged.listen(_authenticate);

  @override
  Future<void> signIn() async => await _client.signIn().then(_authenticate);

  Future<void> _authenticate(GoogleSignInAccount? account) async {
    if (account == null) return;

    final authentication = await account.authentication;

    final idToken = authentication.idToken;

    if (idToken == null) {
      throw "No ID Token found";
    }

    await Supabase.instance.client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: authentication.accessToken,
    );
  }

  @override
  Future<void> signOut() async {
    await _client.signOut();
    await Supabase.instance.client.auth.signOut();
  }
}

AuthService authService = _GoogleOAuthService();
