import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  String? _token;

  // Assume we fetch token from secure storage
  Future<String?> _getToken() async {
    // Example: SharedPreferences or flutter_secure_storage
    return _token ?? "dummy_jwt_token";
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _getToken();
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Token refresh logic here
      print("⚠️ Token expired! Refresh token call...");
    }
    return super.onError(err, handler);
  }
}
