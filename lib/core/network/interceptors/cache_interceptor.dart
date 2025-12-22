import 'package:dio/dio.dart';

class CacheInterceptor extends Interceptor {
  final _cache = <String, Response>{};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_cache.containsKey(options.path)) {
      print("📦 Returning cached response for ${options.path}");
      return handler.resolve(_cache[options.path]!);
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _cache[response.requestOptions.path] = response;
    return handler.next(response);
  }
}
