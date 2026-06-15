class AuthTokens {
  final String accessToken;
  final String refreshToken;
  final DateTime? expiresAt;

  AuthTokens({
    required this.accessToken,
    required this.refreshToken,
    this.expiresAt,
  });

  bool get isExpired => expiresAt != null && DateTime.now().isAfter(expiresAt!);
}
