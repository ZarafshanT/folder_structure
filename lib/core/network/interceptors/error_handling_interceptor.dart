import 'package:dio/dio.dart';

class ErrorHandlingInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      switch (err.response?.statusCode) {
        case 400:
          print("Bad Request");
          break;
        case 401:
          print("Unauthorized");
          break;
        case 403:
          print("Access Denied");
          break;
        case 500:
          print("Server Error");
          break;
        default:
          print("Server error: ${err.response?.statusCode}");
      }
    } else {
      switch (err.type) {
        case DioExceptionType.connectionTimeout:
          print("⏳ Connection timeout");
          break;
        case DioExceptionType.connectionError:
          print("📡 No Internet connection");
          break;
        default:
          print("⚠️ Unexpected error: ${err.message}");
      }
    }
    return handler.next(err);
  }
}
