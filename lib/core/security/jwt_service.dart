import 'dart:convert';

class JwtService {
  Map<String, dynamic>? tryDecode(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;
      final payload = utf8.decode(
        base64Url.decode(base64Url.normalize(parts[1])),
      );
      return json.decode(payload) as Map<String, dynamic>;
    } catch (_) {
      return null;
    }
  }

  bool isExpired(String token) {
    final payload = tryDecode(token);
    final exp = payload?['exp'] as int?;
    if (exp == null) return false;
    final expiry = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
    return DateTime.now().isAfter(expiry);
  }
}
