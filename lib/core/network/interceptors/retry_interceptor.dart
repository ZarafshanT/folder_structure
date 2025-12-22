import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err)) {
      try {
        final response = await err.requestOptions.retry();
        return handler.resolve(response);
      } catch (_) {
        return handler.next(err);
      }
    }
    return handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.connectionError;
  }
}

extension RequestOptionsX on RequestOptions {
  Future<Response<dynamic>> retry() {
    final dio = Dio();
    return dio.request(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(method: method, headers: headers),
    );
  }
}
