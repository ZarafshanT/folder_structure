import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:folder_structure/core/errors/error_message.dart';
// import 'package:folder_structure/core/errors/exceptions.dart'; -> agr error exception class b use krni ho to nechy comment wala code hai
import 'package:folder_structure/core/errors/failure.dart';
import 'package:folder_structure/core/network/dio_client/dio_client.dart';
import 'ia_api_service.dart';

class BaseApiService implements IApiService {
  final Dio _dio;
  BaseApiService({Dio? dio}) : _dio = dio ?? DioClient().dioInstance;

  @override
  Future<Either<Failure, T>> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) parse,
  }) async {
    try {
      final res = await _dio.get(endpoint, queryParameters: queryParameters);
      return Right(parse(res.data));
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (_) {
      return const Left(ServerFailure(ErrorMessages.unknown));
    }
  }

  @override
  Future<Either<Failure, T>> post<T>(
    String endpoint, {
    dynamic data,
    required T Function(dynamic data) parse,
  }) async {
    try {
      final res = await _dio.post(endpoint, data: data);
      return Right(parse(res.data));
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (_) {
      return const Left(ServerFailure(ErrorMessages.unknown));
    }
  }

  @override
  Future<Either<Failure, T>> put<T>(
    String endpoint, {
    dynamic data,
    required T Function(dynamic data) parse,
  }) async {
    try {
      final res = await _dio.put(endpoint, data: data);
      return Right(parse(res.data));
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (_) {
      return const Left(ServerFailure(ErrorMessages.unknown));
    }
  }

  @override
  Future<Either<Failure, T>> delete<T>(
    String endpoint, {
    dynamic data,
    required T Function(dynamic data) parse,
  }) async {
    try {
      final res = await _dio.delete(endpoint, data: data);
      return Right(parse(res.data));
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (_) {
      return const Left(ServerFailure(ErrorMessages.unknown));
    }
  }

  Failure _mapDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ServerFailure(ErrorMessages.timeout);
      case DioExceptionType.connectionError:
        return const NetworkFailure(ErrorMessages.noInternet);
      case DioExceptionType.badResponse:
        final code = e.response?.statusCode;
        if (code == 401) return const AuthFailure(ErrorMessages.unauthorized);
        if (code != null && code >= 500) {
          return ServerFailure(ErrorMessages.server, statusCode: code);
        }
        return ServerFailure(ErrorMessages.unknown, statusCode: code);
      default:
        return const ServerFailure(ErrorMessages.unknown);
    }
  }
}
