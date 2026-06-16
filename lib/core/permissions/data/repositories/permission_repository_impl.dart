import 'package:dartz/dartz.dart';
import 'package:folder_structure/core/errors/failure.dart';
import 'package:folder_structure/core/permissions/data/datasources/permission_remote_datasource.dart';
import 'package:folder_structure/core/permissions/data/mappers/permission_status_mapper.dart';
import 'package:folder_structure/core/permissions/data/mappers/permission_type_mapper.dart';
import 'package:folder_structure/core/permissions/domain/entities/permissions_status_enum.dart';
import 'package:folder_structure/core/permissions/domain/errors/permission_failure.dart';
import 'package:folder_structure/core/permissions/domain/repositories/permission_repository.dart';
import 'package:folder_structure/core/permissions/permission_type.dart';

class PermissionRepositoryImpl implements PermissionRepository {
  final PermissionRemoteDataSource remoteDataSource;

  PermissionRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, PermissionStatusEntity>> requestPermission(AppPermissionType type) async {
    try {
      final permission = type.toPermission();
      final status = await remoteDataSource.requestPermission(permission);
      return Right(status.toEntity());
    } catch (error) {
      return Left(PermissionFailure('Failed to request ${type.name} permission: $error'));
    }
  }

  @override
  Future<Either<Failure, PermissionStatusEntity>> checkPermission(AppPermissionType type) async {
    try {
      final permission = type.toPermission();
      final status = await remoteDataSource.checkPermission(permission);
      return Right(status.toEntity());
    } catch (error) {
      return Left(PermissionFailure('Failed to check ${type.name} permission: $error'));
    }
  }
}
