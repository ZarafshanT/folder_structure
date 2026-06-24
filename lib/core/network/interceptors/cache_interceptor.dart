import 'package:dio/dio.dart';

class CacheInterceptor extends Interceptor {
  final _cache = <String, Response>{};

  String _cacheKey(RequestOptions options) {
    final uri = options.uri;
    return '${options.method}:${uri.toString()}';
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.method.toUpperCase() != 'GET') {
      return handler.next(options);
    }

    final key = _cacheKey(options);
    if (_cache.containsKey(key)) {
      print('📦 Returning cached response for $key');
      return handler.resolve(_cache[key]!);
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.requestOptions.method.toUpperCase() == 'GET') {
      final key = _cacheKey(response.requestOptions);
      _cache[key] = response;
    }
    return handler.next(response);
  }
}
