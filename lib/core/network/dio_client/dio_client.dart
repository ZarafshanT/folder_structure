import 'package:dio/dio.dart';
import 'package:folder_structure/core/network/api_constants/urls.dart';
import 'package:folder_structure/core/network/interceptors/auth_interceptor.dart';
import 'package:folder_structure/core/network/interceptors/cache_interceptor.dart';
import 'package:folder_structure/core/network/interceptors/error_handling_interceptor.dart';
import 'package:folder_structure/core/network/interceptors/header_interceptor.dart';
import 'package:folder_structure/core/network/interceptors/logger_interceptor.dart';
import 'package:folder_structure/core/network/interceptors/retry_interceptor.dart';
import 'package:folder_structure/core/storage/token_storage.dart';
import 'package:get/get.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late final Dio dioInstance;

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    final tokenStorage = Get.find<TokenStorage>();

    final dio = Dio(
      BaseOptions(
        baseUrl: ApiUrls.baseUrl,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        responseType: ResponseType.json,
        sendTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.addAll([
      LoggerInterceptor(), // 🔹 Logs request/response
      AuthInterceptor(dio: dio, tokenStorage: tokenStorage), // 🔹 Injects token
      RetryInterceptor(dio), // 🔹 Retries failed requests
      CacheInterceptor(), // 🔹 Returns cached data if available
      HeaderInterceptor(), // 🔹 Adds app-wide headers
      ErrorHandlingInterceptor(), // 🔹 Handles errors in one place
    ]);

    dioInstance = dio;
  }
}
