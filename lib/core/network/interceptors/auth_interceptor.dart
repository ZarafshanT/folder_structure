import 'dart:async';
import 'package:dio/dio.dart';
import 'package:folder_structure/core/storage/models/auth_tokens.dart';
import 'package:folder_structure/core/storage/token_storage.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final TokenStorage tokenStorage;

  bool _isRefreshing = false;
  Completer<void>? _refreshCompleter;

  AuthInterceptor({
    required this.dio,
    required this.tokenStorage,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Prevent adding standard authorization header to the refresh request
    if (options.path.contains('/auth/refresh')) {
      handler.next(options);
      return;
    }

    final tokens = await tokenStorage.getTokens();

    if (tokens != null && tokens.accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer ${tokens.accessToken}';
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // If the response is not a 401, or if it is a 401 error from the refresh token request itself,
    // do not attempt to refresh to avoid an infinite loop / deadlock.
    if (err.response?.statusCode != 401 || err.requestOptions.path.contains('/auth/refresh')) {
      handler.next(err);
      return;
    }

    try {
      await _handleRefreshToken();

      final response = await _retryRequest(err.requestOptions);

      handler.resolve(response);
    } catch (_) {
      await tokenStorage.clearTokens();

      // Navigate user to login screen
      // AuthBloc.logout();
      // router.go('/login');

      handler.next(err);
    }
  }

  Future<void> _handleRefreshToken() async {
    if (_isRefreshing) {
      await _refreshCompleter?.future;
      return;
    }

    _isRefreshing = true;
    _refreshCompleter = Completer<void>();

    try {
      await _refreshToken();

      _refreshCompleter?.complete();
    } catch (e) {
      _refreshCompleter?.completeError(e);
      rethrow;
    } finally {
      _isRefreshing = false;
    }
  }

  Future<void> _refreshToken() async {
    final tokens = await tokenStorage.getTokens();

    if (tokens == null || tokens.refreshToken.isEmpty) {
      throw Exception('Refresh token not found');
    }

    final response = await dio.post(
      '/auth/refresh',
      data: {'refresh_token': tokens.refreshToken},
      options: Options(headers: {'Authorization': null}),
    );

    final accessToken = response.data['access_token'];
    final newRefreshToken = response.data['refresh_token'];

    await tokenStorage.saveTokens(
      AuthTokens(
        accessToken: accessToken,
        refreshToken: newRefreshToken,
      ),
    );
  }

  Future<Response<dynamic>> _retryRequest(RequestOptions requestOptions) async {
    final tokens = await tokenStorage.getTokens();

    requestOptions.headers['Authorization'] = 'Bearer ${tokens?.accessToken}';

    return dio.fetch(requestOptions);
  }
}
