import 'package:dio/dio.dart';
import 'package:folder_structure/core/network/api_constants/urls.dart';
import 'package:folder_structure/core/network/interceptors/auth_interceptor.dart';
import 'package:folder_structure/core/network/interceptors/cache_interceptor.dart';
import 'package:folder_structure/core/network/interceptors/error_handling_interceptor.dart';
import 'package:folder_structure/core/network/interceptors/header_interceptor.dart';
import 'package:folder_structure/core/network/interceptors/logger_interceptor.dart';
import 'package:folder_structure/core/network/interceptors/retry_interceptor.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late final Dio dioInstance;

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    dioInstance =
        Dio(
            BaseOptions(
              baseUrl: ApiUrls.baseUrl,
              headers: {'Content-Type': 'application/json; charset=UTF-8'},
              responseType: ResponseType.json,
              sendTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
            ),
          )
          ..interceptors.addAll([
            // Add other interceptors like AuthInterceptor if needed
            LoggerInterceptor(), // 🔹 Logs request/response
            AuthInterceptor(), // 🔹 Injects token
            RetryInterceptor(), // 🔹 Retries failed requests
            CacheInterceptor(), // 🔹 Returns cached data if available
            HeaderInterceptor(), // 🔹 Adds app-wide headers
            ErrorHandlingInterceptor(), // 🔹 Handles errors in one place
          ]);
  }
}

// class DioClient {
//   final Dio dio;
//   final SecureStorage storage;

//   static const _kAccess = 'access_token';
//   static const _kRefresh = 'refresh_token';

//   DioClient(this.dio, this.storage) {
//     dio.options.baseUrl = Endpoints.baseUrl;
//     dio.interceptors.add(InterceptorsWrapper(
//       onRequest: (o, h) async {
//         final token = await storage.read(_kAccess);
//         if (token != null) o.headers['Authorization'] = 'Bearer $token';
//         h.next(o);
//       },
//       onError: (e, h) async {
//         if (e.response?.statusCode == 401) {
//           final refreshed = await _refreshToken();
//           if (refreshed) {
//             final req = e.requestOptions;
//             final newResponse = await dio.fetch(req..headers['Authorization'] =
//                 'Bearer ${await storage.read(_kAccess)}');
//             return h.resolve(newResponse);
//           }
//         }
//         h.next(e);
//       },
//     ));
//   }

//   Future<bool> _refreshToken() async {
//     final ref = await storage.read(_kRefresh);
//     if (ref == null) return false;
//     try {
//       final res = await dio.post(Endpoints.refresh, data: {'refreshToken': ref});
//       final data = res.data as Map<String, dynamic>;
//       await storage.write(_kAccess, data['accessToken'] as String);
//       await storage.write(_kRefresh, data['refreshToken'] as String);
//       return true;
//     } catch (_) { return false; }
//   }

//   Future<Response> post(String path, {dynamic data}) => dio.post(path, data: data);
//   Future<Response> get(String path, {Map<String, dynamic>? q}) => dio.get(path, queryParameters: q);

//   Future<void> saveTokens(String access, String refresh) async {
//     await storage.write(_kAccess, access);
//     await storage.write(_kRefresh, refresh);
//   }

//   Future<void> clearTokens() async {
//     await storage.delete(_kAccess);
//     await storage.delete(_kRefresh);
//   }
// }
