import 'package:dio/dio.dart';

class HeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Accept-Language"] = "en";
    options.headers["App-Version"] = "1.0.0";
    return handler.next(options);
  }
}
