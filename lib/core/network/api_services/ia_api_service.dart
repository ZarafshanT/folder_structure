import 'package:dartz/dartz.dart';
import 'package:folder_structure/core/errors/failure.dart';

abstract class IApiService {
  Future<Either<Failure, T>> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) parse,
  });

  Future<Either<Failure, T>> post<T>(
    String endpoint, {
    dynamic data,
    required T Function(dynamic data) parse,
  });

  Future<Either<Failure, T>> put<T>(
    String endpoint, {
    dynamic data,
    required T Function(dynamic data) parse,
  });

  Future<Either<Failure, T>> delete<T>(
    String endpoint, {
    dynamic data,
    required T Function(dynamic data) parse,
  });
}
