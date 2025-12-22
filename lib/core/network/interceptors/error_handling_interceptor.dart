import 'package:dio/dio.dart';

class ErrorHandlingInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String errorMessage;
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage = "⏳ Connection timeout";
        break;
      case DioExceptionType.connectionError:
        errorMessage = "📡 No Internet connection";
        break;
      case DioExceptionType.badResponse:
        errorMessage = "💥 Server error: ${err.response?.statusCode}";
        break;
      default:
        errorMessage = "⚠️ Unexpected error";
    }
    print(errorMessage);
    return handler.next(err);
  }
}
