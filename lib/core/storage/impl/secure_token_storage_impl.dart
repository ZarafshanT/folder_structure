import 'package:folder_structure/core/storage/models/auth_tokens.dart';
import 'package:folder_structure/core/storage/secure_storage.dart';
import 'package:folder_structure/core/storage/token_storage.dart';

class SecureTokenStorageImpl implements TokenStorage {
  final SecureStorage _secureStorage;

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  SecureTokenStorageImpl(this._secureStorage);

  @override
  Future<AuthTokens?> getTokens() async {
    final accessToken = await _secureStorage.read(_accessTokenKey);
    final refreshToken = await _secureStorage.read(_refreshTokenKey);

    if (accessToken != null && refreshToken != null) {
      return AuthTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
    }
    return null;
  }

  @override
  Future<void> saveTokens(AuthTokens tokens) async {
    await _secureStorage.write(_accessTokenKey, tokens.accessToken);
    await _secureStorage.write(_refreshTokenKey, tokens.refreshToken);
  }

  @override
  Future<void> clearTokens() async {
    await _secureStorage.delete(_accessTokenKey);
    await _secureStorage.delete(_refreshTokenKey);
  }
}
