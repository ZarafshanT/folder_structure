import 'package:dartz/dartz.dart';
import 'package:folder_structure/core/errors/failure.dart';
import 'package:folder_structure/core/permissions/permission_type.dart';
import 'package:folder_structure/core/permissions/domain/entities/permissions_status_enum.dart';

abstract class PermissionDatasource {
  Future<Either<Failure, PermissionStatusEntity>> requestPermission(AppPermissionType type);
  Future<Either<Failure, PermissionStatusEntity>> checkPermission(AppPermissionType type);
}
