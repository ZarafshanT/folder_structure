class ServerException implements Exception {
  final String message;
  final int? statusCode;
  ServerException(this.message, {this.statusCode});
}

class CacheException implements Exception {
  final String message;
  CacheException(this.message);
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);
}

class AppException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  AppException(this.message, {this.stackTrace});

  @override
  String toString() => message;
}
